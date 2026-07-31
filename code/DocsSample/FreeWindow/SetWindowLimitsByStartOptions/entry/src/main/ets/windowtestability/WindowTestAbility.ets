// ets/windowtestability/WindowTestAbility.ets
// 新创建的UIAbility
import { window } from '@kit.ArkUI';
import { UIAbility } from '@kit.AbilityKit';

export default class WindowTestAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.info(`Failed to load the content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info('Succeeded in loading the content.');
    });
  }
}
