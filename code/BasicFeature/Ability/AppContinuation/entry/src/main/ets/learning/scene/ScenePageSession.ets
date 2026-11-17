/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/** Shared production page binding: re-subscribe on show, detach on hide; never allocate another Workbench. */
import { LearningController, ScenePositionTarget } from '../LearningController';
import { SceneSnapshot } from './SceneWorkbench';

export class ScenePageSession {
  private readonly kind: string;
  private controller: LearningController | undefined = undefined;
  private subscriptions: (() => void)[] = [];
  private boundRequest: number = -1;
  constructor(kind: string) { this.kind = kind; }
  public bind(controller: LearningController | undefined, changed: () => void): void {
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
  public detach(): void {
    this.subscriptions.forEach((unsubscribe: () => void): void => { unsubscribe(); });
    this.subscriptions = [];
  }
  public hide(): void {
    this.detach();
    if (this.boundRequest >= 0) { this.controller?.leaveBusinessPage(this.boundRequest); }
    this.boundRequest = -1;
  }
  public snapshot(): SceneSnapshot {
    return this.controller === undefined ? new SceneSnapshot() : this.controller.sceneSnapshot(this.kind);
  }
  public target(): ScenePositionTarget | undefined { return this.controller?.positionTarget(); }
  public receipt(target: ScenePositionTarget, first: number, second: number, ok: boolean): void {
    this.controller?.reportScenePosition(target.request, this.kind, target.document.documentId,
      target.document.revision, first, second, ok);
  }
}
