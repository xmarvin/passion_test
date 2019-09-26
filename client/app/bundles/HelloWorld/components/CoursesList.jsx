import PropTypes from 'prop-types';
import React from 'react';
import SuperTreeView from 'react-super-treeview';
import { cloneDeep } from 'lodash';
export default class CoursesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {data: []}
    this.host = 'http://localhost:3000'
  }
  componentWillUnmount() {
  }
  componentDidMount() {

    let self = this
    fetch(this.host + '/verticals.json')
  .then(function(response) {
    return response.json();
  })
  .then(function(json) {
    const verticals = json.records
    self.setState({data: verticals})
  });

  }
  render() {
    return (
     <SuperTreeView
    data={ this.state.data }
    onUpdateCb={(updatedData) => {
        this.setState({data: updatedData})
    }}
    isCheckable={(node, depth)=>{
            return false;
        }}
     isExpandable={(node, depth)=>{
            return depth<2;
        }}
     isDeletable={(node, depth)=>{
            return false;
        }}
     onExpandToggleCb={(node, depth)=>{
        if(node.isExpanded === true){
            node.isChildrenLoading = true;
            let self = this
            let url = ""
            let params = {}
            if (depth == 0){
              url = new URL(this.host + '/categories.json')
              params = {vertical_id: node.id}
            }
            else{
              url = new URL(this.host + '/courses.json')
              params = {category_id: node.id}
            }

            url.search = new URLSearchParams(params)

            fetch(url)
              .then(function(response) {
                return response.json();
              })
              .then(function(json) {
                node.isChildrenLoading = false;
                node.isExpanded = true;
                node.children = json.records
                const updatedData = cloneDeep(self.state.data);
                updatedData.push({name: 'Addd'});
                self.setState({data: updatedData})
                const updatedData2 = cloneDeep(self.state.data);
                updatedData2.pop();
                self.setState({data: updatedData2})
              });
        }
    }}
    />
    );
  }
}
