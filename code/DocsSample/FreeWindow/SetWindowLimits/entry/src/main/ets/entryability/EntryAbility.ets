import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      let windowClass = windowStage.getMainWindowSync();
      try {
        let windowLimits: window.WindowLimits = {
          maxWidth: 1500,
          maxHeight: 1000,
          minWidth: 600,
          minHeight: 500
        };
        let promise = windowClass.setWindowLimits(windowLimits);
        promise.then((data) => {
          console.info('Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.error(`Failed to change the window limits. Cause code: ${err.code}, message: ${err.message}`);
        });
      } catch (exception) {
        console.error(`Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
      }
    });
  }
}
