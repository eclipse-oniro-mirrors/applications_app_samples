/** Shared production page binding: re-subscribe on show, detach on hide; never allocate another Workbench. */
import { LearningController, ScenePositionTarget } from '../LearningController';
import { SceneSnapshot } from './SceneWorkbench';

export class ScenePageSession {
  private readonly kind: string;
  private controller: LearningController | undefined = undefined;
  private subscriptions: (() => void)[] = [];
  private boundRequest: number = -1;
  constructor(kind: string) { this.kind = kind; }
  bind(controller: LearningController | undefined, changed: () => void): void {
    this.detach();
    this.controller = controller;
    if (controller === undefined) { changed(); return; }
    const target = controller.positionTarget();
    this.boundRequest = target === undefined ? -1 : target.request;
    if (target === undefined) { controller.openScene(this.kind); }
    this.subscriptions.push(controller.sceneWorkbench.subscribe(changed));
    this.subscriptions.push(controller.subscribe((): void => { changed(); }));
    changed();
  }
  detach(): void {
    this.subscriptions.forEach((unsubscribe: () => void): void => { unsubscribe(); });
    this.subscriptions = [];
  }
  hide(): void {
    this.detach();
    if (this.boundRequest >= 0) { this.controller?.leaveBusinessPage(this.boundRequest); }
    this.boundRequest = -1;
  }
  snapshot(): SceneSnapshot {
    return this.controller === undefined ? new SceneSnapshot() : this.controller.sceneSnapshot(this.kind);
  }
  target(): ScenePositionTarget | undefined { return this.controller?.positionTarget(); }
  receipt(target: ScenePositionTarget, first: number, second: number, ok: boolean): void {
    this.controller?.reportScenePosition(target.request, this.kind, target.document.documentId,
      target.document.revision, first, second, ok);
  }
}
