import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { attachUiTestAbility, detachUiTestAbility, UiTestAbilitySession } from '../support/UiTestSupport';

/** Test-module routing only. The original ReactiveUi launch remains the default. */
export default class TestAbility extends UIAbility {
  private page: string = 'testability/pages/ReactivePage';
  private scenario: string = 'empty';
  private stage: window.WindowStage | undefined = undefined;
  private session: UiTestAbilitySession | undefined = undefined;

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
    // Never load an arbitrary route supplied by a Want.
    const requested = want.parameters === undefined ? undefined : want.parameters['testPage'];
    this.page = requested === 'SeriesUiQa' ? 'testpages/SeriesUiQaHarness' : 'testability/pages/ReactivePage';
    const scenario = want.parameters === undefined ? undefined : want.parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    if (this.session === undefined) {
      this.session = attachUiTestAbility(this.context);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.stage = windowStage;
    this.loadPage(windowStage);
  }

  onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  onDestroy(): void {
    const session = this.session;
    this.session = undefined;
    if (session !== undefined) { detachUiTestAbility(session); }
  }

  private loadPage(stage: window.WindowStage): void {
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    const page = this.page;
    const session = this.session;
    const generation = session === undefined ? 0 : session.beginLoad(page);
    try {
      stage.loadContent(page, storage, (error): void => {
        const failure = error !== undefined && error.code ? `${error.code} ${error.message}` : '';
        if (session !== undefined) { session.finishLoad(generation, page, failure); }
        if (failure.length > 0) { console.error(`Test page load failed: ${failure}`); }
      });
    } catch (error) {
      const failure = (error as Error).message;
      if (session !== undefined) { session.finishLoad(generation, page, failure); }
      console.error(`Test page load failed: ${failure}`);
    }
  }
}
