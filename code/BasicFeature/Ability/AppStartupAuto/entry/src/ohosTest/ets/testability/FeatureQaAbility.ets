import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

/** No production routes, storage namespaces or permission requests are involved. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private allowed: boolean = false;
  private stage: window.WindowStage | undefined = undefined;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
  }

  onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
    const stage = this.stage;
    if (stage !== undefined) {
      this.loadPage(stage);
    }
  }

  private selectPage(want: Want): void {
    const parameters = want.parameters;
    this.allowed = parameters !== undefined && parameters['testPage'] === 'ArchiveUiQa';
    const scenario = parameters === undefined ? undefined : parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadPage(stage);
  }

  onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  private loadPage(stage: window.WindowStage): void {
    if (!this.allowed) {
      console.error('FeatureQaAbility requires allowlisted testPage=ArchiveUiQa');
      return;
    }
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    stage.loadContent('testpages/ArchiveUiQaHarness', storage, (error): void => {
      if (error.code) {
        console.error(`Archive QA page load failed: ${error.code} ${error.message}`);
      }
    });
  }
}
