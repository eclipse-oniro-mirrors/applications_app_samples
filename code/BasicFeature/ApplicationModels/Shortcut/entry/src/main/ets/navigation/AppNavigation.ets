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

import { uiText } from '../i18n/Strings';
import { logWarning } from '../services/Logger';
import { Want } from '@kit.AbilityKit';
import { promptAction, router } from '@kit.ArkUI';
import { BusinessEntryContext, BusinessSnapshot, NavigationBusiness, businessStore } from '../business/BusinessStore';
import { PageKey } from '../model/ShortcutModels';
import { shortcutService } from '../services/ShortcutService';
import { LaunchRequest, parseLaunchRequest } from './LaunchRequest';

export interface NavigationRouter {
  push(url: string, id: string): Promise<void>;
  replace(url: string, id: string): Promise<void>;
  back(home: boolean): Promise<void>;
  length(): number;
}

export interface NavigationDialog {
  choose(editing: boolean): Promise<number>;
  toast(message: string): void;
}

class PlatformRouter implements NavigationRouter {
  async push(url: string, id: string): Promise<void> {
    await router.pushUrl({ url: url, params: { shortcutId: id } });
  }
  async replace(url: string, id: string): Promise<void> {
    await router.replaceUrl({ url: url, params: { shortcutId: id } });
  }
  async back(home: boolean): Promise<void> {
    if (home) {
      router.back({ url: 'pages/Index' });
    } else {
      router.back();
    }
  }
  length(): number { return Number(router.getLength()); }
}

class PlatformDialog implements NavigationDialog {
  async choose(editing: boolean): Promise<number> {
    const answer = await promptAction.showDialog({
      title: editing ? uiText("shortcut_text_0047") : uiText("shortcut_text_0059"),
      message: uiText("shortcut_text_0044"),
      buttons: [
        { text: uiText("shortcut_text_0043"), color: '#315CF5' },
        { text: uiText("shortcut_text_0236"), color: '#C23F4A' },
        { text: uiText("shortcut_text_0314"), color: '#667085' }
      ]
    });
    return answer.index;
  }
  toast(message: string): void { promptAction.showToast({ message: message }); }
}

/** The same coordinator is used by EntryAbility/pages and controlled router/dialog tests. */
export class AppNavigation {
  private current: PageKey = PageKey.HOME;
  private active: boolean = false;
  private changing: boolean = false;
  private pending: LaunchRequest | undefined = undefined;
  private inFlight: string = '';
  private revisit: (() => void) | undefined = undefined;
  private alive: boolean = false;
  private generation: number = 0;
  private activationRevision: number = 0;
  private business: NavigationBusiness;
  private routes: NavigationRouter;
  private dialogs: NavigationDialog;
  private record: (target: string, source: string, status: string) => void;
  private changed: () => void = () => this.deliverPending();

  constructor(business: NavigationBusiness = businessStore, routes: NavigationRouter = new PlatformRouter(),
    dialogs: NavigationDialog = new PlatformDialog(),
    record: (target: string, source: string, status: string) => void =
      (target: string, source: string, status: string) => shortcutService.recordNavigation(target, source, status)) {
    this.business = business;
    this.routes = routes;
    this.dialogs = dialogs;
    this.record = record;
  }

  initialize(): void {
    this.business.unsubscribe(this.changed);
    this.generation += 1;
    this.alive = true;
    this.active = false;
    this.changing = false;
    this.current = PageKey.HOME;
    this.pending = undefined;
    this.inFlight = '';
    this.business.subscribe(this.changed);
  }

  dispose(): void {
    this.generation += 1;
    this.alive = false;
    this.active = false;
    this.pending = undefined;
    this.revisit = undefined;
    this.business.unsubscribe(this.changed);
  }

  activate(page: PageKey, revisit: () => void): void {
    if (!this.alive) { return; }
    this.activationRevision++;
    this.current = page;
    this.revisit = revisit;
    this.active = true;
    this.deliverPending();
  }

  deactivate(page: PageKey): void {
    if (this.current === page) {
      this.active = false;
      this.revisit = undefined;
    }
  }

  receiveWant(want: Want, cold: boolean): void {
    if (!this.alive) { return; }
    const request: LaunchRequest = parseLaunchRequest(want, cold);
    if (request.error.length > 0) {
      this.safeRecord(uiText("shortcut_text_0432"), 'invalid-parameters', uiText("shortcut_text_0513"));
      return;
    }
    // Coalesce delivery while in flight, not forever: a later desktop click reapplies its filter.
    if (request.key() === this.inFlight || request.key() === this.pending?.key()) { return; }
    this.pending = request;
    this.deliverPending();
  }

  async open(page: PageKey): Promise<void> {
    await this.navigate(new LaunchRequest(page, uiText("shortcut_text_0694")));
  }

  async openDetail(id: string): Promise<void> {
    await this.navigate(new LaunchRequest(PageKey.DETAIL, uiText("shortcut_text_0694"), '', '', id));
  }

  async back(): Promise<void> {
    if (this.changing || !this.alive || !this.active) { return; }
    const generation: number = this.generation;
    this.changing = true;
    try {
      const allowed: boolean = await this.allowLeave(generation);
      if (!this.isCurrent(generation)) { return; }
      if (!allowed) {
        this.pending = undefined;
        return;
      }
      const departureActivation: number = this.activationRevision;
      if (this.routes.length() > 1) {
        await this.routes.back(false);
      } else {
        await this.routes.replace('pages/Index', '');
      }
      if (!this.isCurrent(generation)) { return; }
      // A target activated during back() owns the new handler, even when its PageKey is unchanged.
      if (this.activationRevision === departureActivation) {
        this.active = false;
        this.revisit = undefined;
      }
    } catch (_) {
      if (this.isCurrent(generation)) { this.reportError(); }
    } finally {
      if (this.isCurrent(generation)) {
        this.changing = false;
        this.deliverPending();
      }
    }
  }

  private async allowLeave(generation: number): Promise<boolean> {
    if (this.current !== PageKey.NOTE || !this.business.hasUnsavedNoteWork()) { return true; }
    try {
      const answer: number = await this.dialogs.choose(this.business.snapshot().editingNoteId.length > 0);
      if (!this.isCurrent(generation)) { return false; }
      let success: boolean = false;
      if (answer === 0) {
        success = await this.business.persistForLeave();
      } else if (answer === 1) {
        success = await this.business.discardForLeave();
      } else {
        return false;
      }
      if (!success) { this.safeToast(uiText("shortcut_text_0165")); }
      return success;
    } catch (_) {
      return false;
    }
  }

  private async navigate(request: LaunchRequest): Promise<void> {
    if (!this.alive || !this.active || this.changing) { return; }
    const state: BusinessSnapshot = this.business.snapshot();
    if (!state.ready || state.busy) {
      this.pending = request;
      return;
    }
    const generation: number = this.generation;
    this.changing = true;
    this.inFlight = request.key();
    let checkpoint: BusinessEntryContext | undefined = undefined;
    try {
      if (request.page !== this.current && !await this.allowLeave(generation)) {
        // 旧会话的迟到对话框不得清掉重新初始化后的待跳转请求，也不得写入新会话日志。
        if (!this.isCurrent(generation)) { return; }
        this.pending = undefined;
        this.safeRecord(request.page, request.source, uiText("shortcut_text_0452"));
        return;
      }
      if (!this.isCurrent(generation)) { return; }
      // Checkpoint after a successful leave-save: route rollback must not resurrect saved dirty work.
      checkpoint = this.business.entryContext();
      this.business.applyEntryFilter(request.filter);
      if (request.page === PageKey.NOTE) { this.business.openNote(); }
      if (request.page === this.current && request.page !== PageKey.DETAIL) {
        this.revisit?.();
      } else {
        if (request.page === PageKey.HOME) {
          await this.routes.back(true);
        } else if (this.current === PageKey.HOME) {
          await this.routes.push(this.target(request.page), request.id);
        } else {
          await this.routes.replace(this.target(request.page), request.id);
        }
        if (this.isCurrent(generation) && this.current !== request.page) {
          this.current = request.page;
          this.active = false; // Wait for destination lifecycle before draining another Want.
          this.revisit = undefined;
        }
      }
      if (this.isCurrent(generation)) { this.safeRecord(request.page, request.source, uiText("shortcut_text_0161")); }
    } catch (_) {
      if (this.isCurrent(generation)) {
        if (checkpoint !== undefined) { this.business.restoreEntryContext(checkpoint); }
        this.reportError();
      }
    } finally {
      if (this.isCurrent(generation)) {
        this.changing = false;
        this.inFlight = '';
        this.deliverPending();
      }
    }
  }

  private deliverPending(): void {
    if (!this.alive || !this.active || this.changing || this.pending === undefined) { return; }
    const state: BusinessSnapshot = this.business.snapshot();
    if (!state.ready || state.busy) { return; }
    const request: LaunchRequest = this.pending;
    this.pending = undefined;
    void this.navigate(request);
  }

  private target(page: PageKey): string {
    switch (page) {
      case PageKey.NOTE: return 'pages/NotePage';
      case PageKey.TODO: return 'pages/TodoPage';
      case PageKey.COLLECTION: return 'pages/CollectionPage';
      case PageKey.DETAIL: return 'pages/ShortcutDetailPage';
      case PageKey.CALL_LOG: return 'pages/ActivityPage';
      default: return 'pages/Index';
    }
  }

  private isCurrent(generation: number): boolean { return this.alive && generation === this.generation; }
  private safeRecord(target: string, source: string, status: string): void {
    try { this.record(target, source, status); } catch (_) {
      logWarning('Navigation record callback failed');
    }
  }
  private safeToast(message: string): void {
    try { this.dialogs.toast(message); } catch (_) {
      logWarning('Navigation feedback is unavailable');
    }
  }
  private reportError(): void {
    this.safeRecord(this.current, 'router-failed', uiText("shortcut_text_0513"));
    this.safeToast(uiText("shortcut_text_0641"));
  }
}

export const appNavigation: AppNavigation = new AppNavigation();
