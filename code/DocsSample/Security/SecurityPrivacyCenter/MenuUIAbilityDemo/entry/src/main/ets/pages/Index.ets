// [Start spc_menu_development_guidance_ui_ability_back]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';

const DOMAIN = 0xF811;
const TAG = 'menuuiabilitydemo_Index';

@Entry
@Component
struct Index {

  build() {
    RelativeContainer() {
      // [StartExclude spc_menu_development_guidance_ui_ability_back]
      Text($r('app.string.hello_world'))
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      // [EndExclude spc_menu_development_guidance_ui_ability_back]
      Button($r('app.string.back_button_title'))
        .onClick(() => {
          (this.getUIContext().getHostContext() as common.UIAbilityContext).terminateSelf().catch((err: Error) => {
            hilog.error(DOMAIN, TAG, 'error: %{public}s', JSON.stringify(err));
          });
        })
    }
    .height('100%')
    .width('100%')
  }
}
// [End spc_menu_development_guidance_ui_ability_back]