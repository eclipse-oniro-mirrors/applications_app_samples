// [Start spc_menu_uec_development_guidance_back]
import { UIExtensionContentSession } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;
const TAG: string = 'SPC_UECPage'

@Entry
@Component
struct UECPage {
  private session =
    this.getUIContext().getSharedLocalStorage()?.get<UIExtensionContentSession>('session') as UIExtensionContentSession;

  build() {
    Row() {
      Column() {
        Button('click to back')
          .onClick(() => {
            try {
              this.session.sendData({ 'action': 'exit' })
            } catch (error) {
              hilog.error(DOMAIN, TAG, 'sendData error');
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End spc_menu_uec_development_guidance_back]