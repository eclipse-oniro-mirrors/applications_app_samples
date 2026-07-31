// EntryAbility.ets
// 示例应用的入口
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.info('Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      AppStorage.setOrCreate<window.WindowStage>('windowStage', windowStage);
    });
  }
}
