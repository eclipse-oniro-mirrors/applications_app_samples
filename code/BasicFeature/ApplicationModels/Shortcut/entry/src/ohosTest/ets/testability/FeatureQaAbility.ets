import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { attachRecycleUiQaAbility, detachRecycleUiQaAbility,
  RecycleUiQaAbilitySession } from '../support/RecycleUiQaSupport';

/** This ability is installed only in entry_test; it never starts EntryAbility. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private allowed: boolean = false;
  private stage: window.WindowStage | undefined = undefined;
  private qaSession: RecycleUiQaAbilitySession | undefined = undefined;

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
    this.allowed = parameters !== undefined && parameters['testPage'] === 'RecycleUiQa';
    const scenario = parameters === undefined ? undefined : parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    if (this.allowed && this.qaSession === undefined) {
      this.qaSession = attachRecycleUiQaAbility(this.context);
    }
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadPage(stage);
  }

  onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  onDestroy(): void {
    const session = this.qaSession;
    this.qaSession = undefined;
    if (session !== undefined) { detachRecycleUiQaAbility(session); }
  }

  private loadPage(stage: window.WindowStage): void {
    if (!this.allowed) {
      console.error('FeatureQaAbility requires allowlisted testPage=RecycleUiQa');
      return;
    }
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    stage.loadContent('testpages/RecycleUiQaHarness', storage, (error): void => {
      if (error.code) {
        console.error(`Recycle QA page load failed: ${error.code} ${error.message}`);
      }
    });
  }
}
