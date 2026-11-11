/** Platform entry for the API learning application. No SDK probe runs on normal startup. */
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { LearningController } from '../learning/LearningController';
import { clearLearningController, publishLearningController } from '../learning/LearningContext';
import { clearSceneWorkbench, publishSceneWorkbench } from '../learning/scene/SceneContext';

const DOMAIN: number = 0x1A20;
const TAG: string = 'ContinueLearning';

export default class EntryAbility extends UIAbility {
  private controller: LearningController | undefined = undefined;
  private stage: window.WindowStage | undefined = undefined;
  private windowGeneration: number = 0;
  private unsubscribe: (() => void) | undefined = undefined;
  private routeKey: string = '';
  private routing: boolean = false;

  private routePending(): void {
    const controller = this.controller;
    const stage = this.stage;
    if (this.routing || controller === undefined || stage === undefined) { return; }
    const snapshot = controller.snapshot();
    const key = `${snapshot.positionRequest}:${snapshot.targetPage}`;
    if (snapshot.sessionRecordId.length > 0 && key !== this.routeKey) { this.loadPage(stage, snapshot.targetPage); }
  }

  private ensureController(): LearningController {
    let controller = this.controller;
    if (controller === undefined) {
      controller = new LearningController(this.context);
      this.controller = controller;
      publishLearningController(controller);
      publishSceneWorkbench(controller.sceneWorkbench);
      this.unsubscribe = controller.subscribe((): void => { this.routePending(); });
    }
    return controller;
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'onCreate');
    this.ensureController().handleLaunch(want, launchParam.launchReason as number);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const controller = this.ensureController();
    const continuation = launchParam.launchReason === AbilityConstant.LaunchReason.PREPARE_CONTINUATION ||
      launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION;
    const stage = this.stage;
    this.routing = true;
    try {
      if (continuation && stage !== undefined) { controller.markWindowGone(); }
      controller.handleLaunch(want, launchParam.launchReason as number);
    } finally { this.routing = false; }
    if (continuation && stage !== undefined) { this.routePending(); }
  }

  onContinue(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    const controller = this.controller;
    return controller === undefined ? AbilityConstant.OnContinueResult.REJECT :
      controller.buildContinuation(wantParam);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.stage = windowStage;
    const controller = this.ensureController();
    const reason = controller.snapshot().launchReasonCode;
    this.loadPage(windowStage, reason === 10 || reason === 3 ? controller.snapshot().targetPage : 'pages/Index');
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
    } catch (error) {
      hilog.warn(DOMAIN, TAG, '%{public}s', 'Unable to set application color mode');
    }
  }

  onWindowStageRestore(windowStage: window.WindowStage): void {
    // This build writes SUPPORT_CONTINUE_PAGE_STACK_KEY=false in onContinue.
    // It uses explicit, fixed pages rather than mixing loadContent with automatic stack restoration.
    this.stage = windowStage;
    this.routeKey = '';
    this.loadPage(windowStage, this.ensureController().snapshot().targetPage);
  }

  private loadPage(stage: window.WindowStage, page: string): void {
    const controller = this.controller;
    if (controller === undefined) {
      return;
    }
    const generation = ++this.windowGeneration;
    this.routing = true;
    controller.markWindowGone();
    const target = controller.snapshot();
    this.routeKey = `${target.positionRequest}:${target.targetPage}`;
    try {
      stage.loadContent(page, (error) => {
        if (generation !== this.windowGeneration || controller !== this.controller || stage !== this.stage) {
          return;
        }
        if (error !== undefined && error.code !== 0) {
          controller.reportPageFailure(`页面加载失败：${page}；平台错误码 ${error.code}。`);
          if (page !== 'pages/Index') {
            this.loadPage(stage, 'pages/Index');
          }
          return;
        }
        controller.markWindowReady();
      });
    } catch (error) {
      if (generation !== this.windowGeneration || controller !== this.controller) {
        return;
      }
      controller.reportPageFailure(`加载 ${page} 时同步异常；未把窗口标记为就绪。`);
      if (page !== 'pages/Index') {
        this.loadPage(stage, 'pages/Index');
      }
    } finally {
      this.routing = false;
    }
  }

  onWindowStageDestroy(): void {
    this.windowGeneration++;
    this.stage = undefined;
    this.controller?.markWindowGone();
  }

  onDestroy(): void {
    this.windowGeneration++;
    this.stage = undefined;
    this.unsubscribe?.();
    this.unsubscribe = undefined;
    this.controller?.dispose();
    this.controller = undefined;
    clearLearningController();
    clearSceneWorkbench();
  }
}
