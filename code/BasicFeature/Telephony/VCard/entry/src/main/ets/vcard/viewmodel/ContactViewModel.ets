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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIContext } from '@kit.ArkUI';
import {
  ContactDraft,
  ContactLoadState,
  ContactSummary,
  ErrorExplain,
  HistoryAction,
  HistoryEntry,
  Logger,
  PermissionState,
  VCardManager
} from 'library';

const PERMISSION_COUNT: number = 2;
const UNKNOWN_CODE: number = 0;

@ObservedV2
export class ContactViewModel {
  @Trace public state: ContactLoadState = ContactLoadState.IDLE;
  @Trace public contacts: ContactSummary[] = [];
  @Trace public keyword: string = '';
  @Trace public demoMode: boolean = false;
  @Trace public permissionGranted: boolean = false;
  @Trace public busy: boolean = false;
  @Trace public errorCode: number = UNKNOWN_CODE;
  @Trace public selected: ContactSummary | undefined = undefined;
  @Trace public draft: ContactDraft = new ContactDraft();

  private context: common.Context | undefined = undefined;
  private uiContext: UIContext | undefined = undefined;
  private emptyContact: ContactSummary = new ContactSummary();

  @Computed
  get filteredContacts(): ContactSummary[] {
    const key: string = this.keyword.trim().toLowerCase();
    if (key.length === 0) {
      return this.contacts;
    }
    return this.contacts.filter((item: ContactSummary) => ContactViewModel.matches(item, key));
  }

  init(context: common.Context): void {
    this.context = context;
    this.refresh();
  }

  setUIContext(uiContext: UIContext): void {
    this.uiContext = uiContext;
  }

  async refresh(): Promise<void> {
    const context: common.Context | undefined = this.context;
    if (context === undefined) {
      return;
    }
    if (this.demoMode) {
      await this.loadDemo();
      return;
    }
    this.state = ContactLoadState.LOADING;
    this.busy = true;
    this.errorCode = UNKNOWN_CODE;
    try {
      const granted: boolean = await this.checkPermissions(context);
      this.permissionGranted = granted;
      if (!granted) {
        this.state = ContactLoadState.DENIED;
        return;
      }
      const list: ContactSummary[] = await VCardManager.loadContacts(context);
      this.contacts = list;
      this.state = ContactLoadState.READY;
      Logger.info('[ContactViewModel] refresh size=' + list.length);
    } catch (error) {
      this.recordError('refresh', error);
      this.state = ContactLoadState.ERROR;
    } finally {
      this.busy = false;
    }
  }

  async requestPermission(): Promise<void> {
    const context: common.Context | undefined = this.context;
    if (context === undefined) {
      return;
    }
    this.busy = true;
    try {
      const granted: boolean = await VCardManager.requestPermissions(context);
      if (granted) {
        this.toast($r('app.string.vc_permission_request_ok'));
        await this.refresh();
      } else {
        this.toast($r('app.string.vc_permission_request_failed', ''));
      }
    } catch (error) {
      const message: string = this.errorMessage(error);
      this.recordError('requestPermission', error);
      this.toast($r('app.string.vc_permission_request_failed', message));
    } finally {
      this.busy = false;
    }
  }

  async loadDemo(): Promise<void> {
    const context: common.Context | undefined = this.context;
    if (context === undefined) {
      return;
    }
    this.state = ContactLoadState.LOADING;
    this.busy = true;
    this.errorCode = UNKNOWN_CODE;
    try {
      const list: ContactSummary[] = await VCardManager.loadSampleContacts(context);
      this.contacts = list;
      this.demoMode = true;
      this.keyword = '';
      this.state = ContactLoadState.READY;
      Logger.info('[ContactViewModel] loadDemo size=' + list.length);
    } catch (error) {
      this.recordError('loadDemo', error);
      this.state = ContactLoadState.ERROR;
    } finally {
      this.busy = false;
    }
  }

  exitDemo(): void {
    this.demoMode = false;
    this.keyword = '';
    this.refresh();
  }

  search(keyword: string): void {
    this.keyword = keyword;
  }

  openDetail(contact: ContactSummary): void {
    this.selected = contact;
    this.errorCode = UNKNOWN_CODE;
  }

  startCreate(): boolean {
    if (this.demoMode) {
      this.toast($r('app.string.vc_contacts_demo_hint'));
      return false;
    }
    this.selected = undefined;
    this.draft = new ContactDraft();
    this.errorCode = UNKNOWN_CODE;
    return true;
  }

  startEdit(): boolean {
    if (this.demoMode) {
      this.toast($r('app.string.vc_contacts_demo_hint'));
      return false;
    }
    const source: ContactSummary | undefined = this.selected;
    if (source === undefined) {
      return false;
    }
    const draft: ContactDraft = new ContactDraft();
    draft.fullName = source.fullName;
    draft.phone = source.phones.length > 0 ? source.phones[0] : '';
    draft.email = source.emails.length > 0 ? source.emails[0] : '';
    draft.organization = source.organization;
    draft.jobTitle = source.jobTitle;
    draft.note = source.note;
    this.draft = draft;
    this.errorCode = UNKNOWN_CODE;
    return true;
  }

  async save(): Promise<boolean> {
    if (this.demoMode) {
      this.toast($r('app.string.vc_contacts_demo_hint'));
      return false;
    }
    const context: common.Context | undefined = this.context;
    if (context === undefined) {
      return false;
    }
    const creating: boolean = this.selected === undefined;
    const target: ContactSummary = this.selectedContact();
    this.busy = true;
    this.errorCode = UNKNOWN_CODE;
    try {
      if (creating) {
        const id: number = await VCardManager.createContact(context, this.draft);
        Logger.info('[ContactViewModel] created id=' + id);
        await this.appendHistory(HistoryAction.CREATE, this.draft.fullName);
      } else {
        await VCardManager.updateContact(context, target, this.draft);
        Logger.info('[ContactViewModel] updated key=' + target.key);
        await this.appendHistory(HistoryAction.UPDATE, this.draft.fullName);
      }
      this.selected = undefined;
      await this.refresh();
      return true;
    } catch (error) {
      this.recordError('save', error);
      this.toast($r('app.string.vc_edit_save_failed'));
      return false;
    } finally {
      this.busy = false;
    }
  }

  async remove(): Promise<boolean> {
    if (this.demoMode) {
      this.toast($r('app.string.vc_contacts_demo_hint'));
      return false;
    }
    const context: common.Context | undefined = this.context;
    const target: ContactSummary | undefined = this.selected;
    if (context === undefined || target === undefined) {
      return false;
    }
    this.busy = true;
    this.errorCode = UNKNOWN_CODE;
    try {
      await VCardManager.removeContact(context, target.key);
      await this.appendHistory(HistoryAction.DELETE, target.fullName);
      this.selected = undefined;
      await this.refresh();
      return true;
    } catch (error) {
      this.recordError('remove', error);
      return false;
    } finally {
      this.busy = false;
    }
  }

  selectedContact(): ContactSummary {
    const current: ContactSummary | undefined = this.selected;
    return current === undefined ? this.emptyContact : current;
  }

  explainError(): ErrorExplain {
    return VCardManager.explain(this.errorCode);
  }

  private async checkPermissions(context: common.Context): Promise<boolean> {
    const states: PermissionState[] = await VCardManager.getPermissionStates(context);
    if (states.length < PERMISSION_COUNT) {
      return false;
    }
    return states[0].granted && states[1].granted;
  }

  private async appendHistory(action: number, target: string): Promise<void> {
    const context: common.Context | undefined = this.context;
    if (context === undefined) {
      return;
    }
    try {
      const entry: HistoryEntry = new HistoryEntry();
      entry.id = Date.now().toString();
      entry.action = action;
      entry.target = target;
      entry.cardCount = 1;
      entry.success = true;
      entry.code = 0;
      entry.timestamp = Date.now();
      await VCardManager.appendHistory(context, entry);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[ContactViewModel] appendHistory failed code=' + err.code + ' message=' + err.message);
    }
  }

  private recordError(action: string, error: Error): void {
    const err: BusinessError = error as BusinessError;
    const code: number = typeof err.code === 'number' ? err.code : UNKNOWN_CODE;
    this.errorCode = code;
    Logger.error('[ContactViewModel] ' + action + ' failed code=' + code + ' message=' + err.message);
  }

  private errorMessage(error: Error): string {
    const err: BusinessError = error as BusinessError;
    return typeof err.message === 'string' ? err.message : '';
  }

  private toast(message: ResourceStr): void {
    if (this.uiContext === undefined) {
      return;
    }
    this.uiContext.getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private static matches(contact: ContactSummary, keyword: string): boolean {
    if (ContactViewModel.hit(contact.fullName, keyword)) {
      return true;
    }
    if (ContactViewModel.hit(contact.organization, keyword)) {
      return true;
    }
    if (ContactViewModel.hit(contact.jobTitle, keyword)) {
      return true;
    }
    for (const phone of contact.phones) {
      if (ContactViewModel.hit(phone, keyword)) {
        return true;
      }
    }
    for (const email of contact.emails) {
      if (ContactViewModel.hit(email, keyword)) {
        return true;
      }
    }
    return false;
  }

  private static hit(value: string, keyword: string): boolean {
    return value.toLowerCase().indexOf(keyword) >= 0;
  }
}
