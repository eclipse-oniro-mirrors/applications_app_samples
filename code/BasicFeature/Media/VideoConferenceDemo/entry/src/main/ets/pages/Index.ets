import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { CustomToolBar } from '../components/CustomToolBar';
import { SubWindowManager } from '../common/SubWindowManager';
import { AudioDevice } from '../components/AudioDevice';
import { ConferenceVideo } from '../components/ConferenceVideo';
import { checkPermission, requestPermissions } from '../common/utils/PermissionUtil';
import { Logger } from '../common/utils/Logger';

const TAG = 'Index'

@Entry
@Component
struct Index {
  private uiContext = this.getUIContext();
  private context = this.uiContext.getHostContext() as common.UIAbilityContext;

  aboutToAppear(): void {
    this.checkPermission();
  }

  aboutToDisappear(): void {
    SubWindowManager.destroy();
  }

  checkPermission() {
    checkPermission('ohos.permission.MICROPHONE')
      .then((status: abilityAccessCtrl.GrantStatus) => {
        if (status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
          requestPermissions(this.context as common.UIAbilityContext, ['ohos.permission.MICROPHONE']);
        }
      })
      .catch((err: BusinessError) => {
        Logger.error(TAG, `Check permission failed, error code: ${err.code}, message: ${err.message}`);
      });
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          ConferenceVideo()
        }
        .width('100%')
        .aspectRatio(16 / 9)
        .backgroundColor(Color.White)

      }
      .backgroundColor($r('sys.color.black'))
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

      CustomToolBar()

      Row() {
        AudioDevice()

        Button('离开', { buttonStyle: ButtonStyleMode.EMPHASIZED, role: ButtonRole.ERROR })
          .width(88)
          .height(28)
          .onClick(() => {
            this.context.terminateSelf();
          })
      }
      .width('100%')
      .height(28)
      .padding({ left: 16, right: 16 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .position({ top: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}