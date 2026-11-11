import { ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppService, createAppService } from '../core/AppService';
import { logLaunchPhase } from '../core/LaunchEvidence';

export default class EntryAbility extends UIAbility {
  private service: AppService | undefined = undefined;

  onCreate(): void {
    logLaunchPhase('UIAbility.onCreate');
    this.service = createAppService(this.context);
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
    } catch (error) {
      hilog.warn(0x1A00, 'AppPerformance', 'setColorMode failed');
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logLaunchPhase('UIAbility.onWindowStageCreate');
    windowStage.loadContent('pages/Index', (error) => {
      if (error.code) {
        hilog.error(0x1A00, 'AppPerformance', 'loadContent: %{public}s', error.message);
        return;
      }
      logLaunchPhase('windowStage.loadContent.completed');
      this.service?.markContentLoaded();
    });
  }

  onForeground(): void {
    this.service?.setForeground(true);
  }

  onBackground(): void {
    this.service?.setForeground(false);
  }
}
