import { PromptAction } from '@kit.ArkUI';
import { SubWindowManager } from '../common/SubWindowManager';
import { startCapture, stopCapture } from '../common/utils/AVScreenCaptureUtil';
import { CustomToolBarItem, ToolBarItem } from './CustomToolBarItem';
import capture from 'libentry.so'

@Component
export struct CustomToolBar {
  private uiContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private context = this.getUIContext().getHostContext();
  @State isMicrophone: boolean = false;
  @State toolBarItems: ToolBarItem[] = [
    new ToolBarItem({
      id: '1',
      label: '语音',
      iconActive: $r('sys.symbol.mic_fill'),
      iconInactive: $r('sys.symbol.mic_slash_fill'),
      iconActiveColors: [Color.White],
      iconInActiveColors: [Color.White, Color.Red],
      isActive: false,
      onClick: (isActive: boolean) => {
        if (isActive) {
          this.isMicrophone = true;
        } else {
          this.isMicrophone = false;
        };
        capture.setMicrophoneEnabled(isActive)
      }
    }),
    new ToolBarItem({
      id: '2',
      label: '视频',
      iconActive: $r('sys.symbol.video_fill'),
      iconInactive: $r('sys.symbol.video_slasj_fill'),
      iconActiveColors: [Color.White],
      iconInActiveColors: [Color.White, Color.Red],
      isActive: false,
      onClick: (isActive: boolean) => {
        isActive ? SubWindowManager.open() : SubWindowManager.hide()
      }
    }),
    new ToolBarItem({
      id: '3',
      label: '共享屏幕',
      iconActive: $r('sys.symbol.computer_share_fill'),
      iconActiveColors: [Color.White, Color.White],
      iconInActiveColors: [Color.White, Color.White],
      isActive: false,
      onClick: (isActive: boolean) => {
        this.promptAction.showToast({
          message: '暂不支持此功能'
        })
      }
    }),
    new ToolBarItem({
      id: '4',
      label: '录制',
      iconActive: $r('sys.symbol.record_circle'),
      iconActiveColors: [Color.Red, Color.Red],
      iconInActiveColors: [Color.White, Color.Red],
      isActive: false,
      onClick: (isActive: boolean) => {
        console.log('isactive:' + isActive)
        if (!this.context) {
          return;
        }
        capture.setStopCallbackToFile(this.stopCallback.bind(this));
        if (isActive) {
          startCapture(this.context, this.isMicrophone);
        } else {
          stopCapture(this.context);
        }
      }
    }),
    new ToolBarItem({
      id: '5',
      label: '更多',
      iconActive: $r('sys.symbol.dot_grid_2x2'),
      iconActiveColors: [Color.White, Color.White],
      iconInActiveColors: [Color.White, Color.White],
      isActive: false,
      onClick: () => {
      }
    })
  ];

  stopCallback(): void {
    this.toolBarItems[3].isActive = false;
  }

  build() {
    Row() {
      ForEach(this.toolBarItems, (item: ToolBarItem) => {
        CustomToolBarItem({ toolBarItem: item })
      }, (item: ToolBarItem) => item.id)
    }
    .width('100%')
    .height(56)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Start)
  }
}