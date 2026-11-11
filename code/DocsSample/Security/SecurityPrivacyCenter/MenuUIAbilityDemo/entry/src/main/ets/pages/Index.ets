// [Start spc_menu_development_guidance_ui_ability_back]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';

const DOMAIN = 0x0000;
const TAG = 'SPC_EntryAbility';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      // [StartExclude spc_menu_development_guidance_ui_ability_back]
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      // [EndExclude spc_menu_development_guidance_ui_ability_back]
      Button('click to back')
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