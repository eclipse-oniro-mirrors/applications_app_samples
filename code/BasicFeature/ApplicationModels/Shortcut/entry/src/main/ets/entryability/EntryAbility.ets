import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { businessStore } from '../business/BusinessStore';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const context = this.context.getApplicationContext();
    businessStore.initialize(context);
    appNavigation.initialize();
    shortcutService.initialize(context);
    appNavigation.receiveWant(want, true);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    appNavigation.receiveWant(want, false);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (error) => {
      if (error.code) {
        hilog.error(0x1B60, 'Shortcut', 'loadContent: %{public}s', error.message);
      }
    });
  }

  onDestroy(): void {
    appNavigation.dispose();
    shortcutService.dispose();
    businessStore.dispose();
  }
}
