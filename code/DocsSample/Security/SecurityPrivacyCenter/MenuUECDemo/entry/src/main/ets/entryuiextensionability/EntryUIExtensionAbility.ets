// [Start spc_menu_uec_development_guidance_ability]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';

const DOMAIN = 0x0000;
const TAG: string = 'SPC_EntryUIExtensionAbility'

export default class EntryUIExtensionAbility extends UIExtensionAbility {
  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onSessionCreate');
    let param: Record<string, Object> = {
      'session': session
    }
    let storage: LocalStorage = new LocalStorage(param)
    session.loadContent('pages/UECPage', storage)
  }
  // [StartExclude spc_menu_uec_development_guidance_ability]
  async onCreate(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onCreate');
  }

  onSessionDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onSessionDestroy');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onDestroy');
  }
  // [EndExclude spc_menu_uec_development_guidance_ability]
}
// [End spc_menu_uec_development_guidance_ability]