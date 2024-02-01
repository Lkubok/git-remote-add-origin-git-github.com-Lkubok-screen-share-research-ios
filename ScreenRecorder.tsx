import React, {Component} from 'react';
import ReactNative, {
  FlatList,
  Text,
  TouchableOpacity,
  UIManager,
  requireNativeComponent,
} from 'react-native';

const RecordComponent = requireNativeComponent('RecordComponent');

export default class ScreenRecorder extends Component {
  constructor(props) {
    super(props);
    this.state = {recordings: []};
  }

  viewRecording = fileName => {
    UIManager.dispatchViewManagerCommand(
      ReactNative.findNodeHandle(this.recordComponent),
      UIManager.RecordComponent.Commands.showSaveView,
      [fileName],
    );
  };

  render() {
    return (
      <>
        <RecordComponent style={{width: 250, height: 250}} />
        <FlatList
          data={this.state.recordings}
          renderItem={item => {
            return (
              <TouchableOpacity onPress={() => this.viewRecording(item.item)}>
                <Text style={{fontSize: 20}}>
                  {item.item.absolutePath.split('/').splice(-1)[0]}
                </Text>
              </TouchableOpacity>
            );
          }}
        />
      </>
    );
  }
}
