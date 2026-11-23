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

import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';

/**
 * Full name of a contact, it mirrors the Name object of the contacts provider.
 */
export interface ContactNameInfo {
  fullName: string;
  firstName: string;
  middleName: string;
  lastName: string;
  prefix: string;
  suffix: string;
}

/**
 * Phone number of a contact, it mirrors the PhoneNumber object of the provider.
 */
export interface ContactPhoneInfo {
  phoneNumber: string;
  labelId: number;
  labelName: string;
}

/**
 * Email address of a contact, it mirrors the Email object of the provider.
 */
export interface ContactEmailInfo {
  email: string;
  labelId: number;
  labelName: string;
}

/**
 * Postal address of a contact.
 */
export interface ContactPostalInfo {
  postalAddress: string;
  labelId: number;
  labelName: string;
}

/**
 * One contact record as the sample sees it. The provider assigns the id on creation and keeps
 * the mutable fields of the record in sync on every update.
 */
export interface ContactRecord {
  id: number;
  name: ContactNameInfo;
  displayName: string;
  phoneNumbers: ContactPhoneInfo[];
  emails: ContactEmailInfo[];
  postalAddresses: ContactPostalInfo[];
  organization: string;
  title: string;
  note: string;
  ringtone: string;
  sourceType: number;
  isMyCard: boolean;
  avatarUri: string;
}

/**
 * Options of the contact.pickContact API, mirror the contact class of the SDK.
 */
export class ContactFactory {
  public static readonly DEFAULT_ID: number = 0;
  public static readonly SELF_SOURCE_TYPE: number = 0;

  public static emptyName(): ContactNameInfo {
    return {
      fullName: '',
      firstName: '',
      middleName: '',
      lastName: '',
      prefix: '',
      suffix: ''
    };
  }

  public static buildName(fullName: string): ContactNameInfo {
    return {
      fullName: fullName,
      firstName: '',
      middleName: '',
      lastName: '',
      prefix: '',
      suffix: ''
    };
  }

  public static buildPhone(phoneNumber: string, labelId: number, labelName: string): ContactPhoneInfo {
    return {
      phoneNumber: phoneNumber,
      labelId: labelId,
      labelName: labelName
    };
  }

  public static buildEmail(email: string, labelId: number, labelName: string): ContactEmailInfo {
    return {
      email: email,
      labelId: labelId,
      labelName: labelName
    };
  }

  public static buildRecord(displayName: string, phone: string): ContactRecord {
    return {
      id: ContactFactory.DEFAULT_ID,
      name: ContactFactory.buildName(displayName),
      displayName: displayName,
      phoneNumbers: [ContactFactory.buildPhone(phone, 0, 'CELL')],
      emails: [],
      postalAddresses: [],
      organization: '',
      title: '',
      note: '',
      ringtone: '',
      sourceType: ContactFactory.SELF_SOURCE_TYPE,
      isMyCard: false,
      avatarUri: ''
    };
  }

  public static withId(record: ContactRecord, id: number): ContactRecord {
    const copy: ContactRecord = JSON.parse(JSON.stringify(record)) as ContactRecord;
    copy.id = id;
    return copy;
  }
}

/**
 * Fingerprint of a contact, it is used to detect duplicate records and to build the display
 * key of the contact list.
 */
export class ContactFingerprint {
  private normalizedPhone: string;
  private normalizedName: string;

  constructor(record: ContactRecord) {
    this.normalizedPhone = ContactNormalizer.normalizePhone(record.phoneNumbers);
    this.normalizedName = ContactNormalizer.trimName(record.displayName);
  }

  public key(): string {
    return `${this.normalizedPhone}#${this.normalizedName}`;
  }

  public hasPhone(): boolean {
    return this.normalizedPhone.length > 0;
  }

  public hasName(): boolean {
    return this.normalizedName.length > 0;
  }

  public equals(other: ContactFingerprint): boolean {
    return this.key() === other.key();
  }
}

/**
 * Normalization helpers for the contact fields. The contacts service compares records by the
 * normalized phone number, so the phone is the stable identity of a record.
 */
export class ContactNormalizer {
  public static readonly EMPTY_PHONE: string = '';

  public static trimName(name: string): string {
    return name.replace(/\s+/g, ' ').trim();
  }

  public static normalizePhone(phones: ContactPhoneInfo[]): string {
    for (let i = 0; i < phones.length; i++) {
      const digits: string = ContactNormalizer.digitsOf(phones[i].phoneNumber);
      if (digits.length > 0) {
        return digits;
      }
    }
    return ContactNormalizer.EMPTY_PHONE;
  }

  public static digitsOf(phone: string): string {
    const builder: string[] = [];
    for (let i = 0; i < phone.length; i++) {
      const char: string = phone.charAt(i);
      if (char >= '0' && char <= '9') {
        builder.push(char);
      }
    }
    return builder.join('');
  }

  public static hasDigit(phone: string): boolean {
    for (let i = 0; i < phone.length; i++) {
      const char: string = phone.charAt(i);
      if (char >= '0' && char <= '9') {
        return true;
      }
    }
    return false;
  }

  public static isEmptyOrEmpty(digits: string): boolean {
    return digits.length === 0;
  }
}

/**
 * Validates a contact before it is handed to the addContact API.
 */
export class ContactValidator {
  public static readonly MAX_NAME: number = 128;
  public static readonly MAX_PHONE: number = 20;
  public static readonly MAX_EMAIL: number = 128;

  public static isValidName(name: string): boolean {
    const trimmed: string = ContactNormalizer.trimName(name);
    return trimmed.length > 0 && trimmed.length <= ContactValidator.MAX_NAME;
  }

  public static isValidPhone(phone: string): boolean {
    const digits: string = ContactNormalizer.digitsOf(phone);
    return digits.length >= 3 && digits.length <= ContactValidator.MAX_PHONE;
  }

  public static isValidEmail(email: string): boolean {
    if (email.length === 0) {
      return false;
    }
    const atIndex: number = email.indexOf('@');
    if (atIndex <= 0 || atIndex === email.length - 1) {
      return false;
    }
    const domain: string = email.substring(atIndex + 1);
    return domain.indexOf('.') > 0;
  }

  public static isValidRecord(record: ContactRecord): boolean {
    if (!ContactValidator.isValidName(record.displayName)) {
      return false;
    }
    for (let i = 0; i < record.phoneNumbers.length; i++) {
      if (ContactValidator.isValidPhone(record.phoneNumbers[i].phoneNumber)) {
        return true;
      }
    }
    return record.emails.length > 0;
  }

  public static describeInvalid(record: ContactRecord): string {
    if (!ContactValidator.isValidName(record.displayName)) {
      return 'invalid name';
    }
    return 'missing contact channel';
  }
}

/**
 * Builds the picker session options used by the sample.
 */
export class PickerOptions {
  public isMultiSelect: boolean;
  public maxSelectable: number;
  private selectedCount: number = 0;

  constructor(isMultiSelect: boolean, maxSelectable: number) {
    this.isMultiSelect = isMultiSelect;
    this.maxSelectable = maxSelectable;
  }

  public single(): boolean {
    return !this.isMultiSelect;
  }

  public capacity(): number {
    if (this.single()) {
      return 1;
    }
    return this.maxSelectable;
  }

  public setSelectedCount(count: number): void {
    if (count >= 0) {
      this.selectedCount = count;
    }
  }

  public getSelectedCount(): number {
    return this.selectedCount;
  }

  public canSelectMore(): boolean {
    return this.selectedCount < this.capacity();
  }

  public describe(): string {
    return `PickerOptions{multi=${this.isMultiSelect}, max=${this.maxSelectable}, ` +
      `selected=${this.selectedCount}}`;
  }
}

/**
 * Tracks the lifecycle of one picker session.
 */
export class PickerSession {
  private opened: boolean = false;
  private resolved: boolean = false;
  private cancelled: boolean = false;
  private resultCount: number = 0;
  private openedAt: number = 0;
  private resolvedAt: number = 0;

  public open(): void {
    this.opened = true;
    this.openedAt = Date.now();
  }

  public resolve(count: number): void {
    this.resolved = true;
    this.resultCount = count;
    this.resolvedAt = Date.now();
  }

  public cancel(): void {
    this.cancelled = true;
    this.resolved = true;
  }

  public isOpened(): boolean {
    return this.opened;
  }

  public isResolved(): boolean {
    return this.resolved;
  }

  public isCancelled(): boolean {
    return this.cancelled;
  }

  public getResultCount(): number {
    return this.resultCount;
  }

  public durationMs(): number {
    if (!this.opened || !this.resolved) {
      return 0;
    }
    return this.resolvedAt - this.openedAt;
  }

  public describe(): string {
    return `PickerSession{opened=${this.opened}, resolved=${this.resolved}, ` +
      `cancelled=${this.cancelled}, results=${this.resultCount}}`;
  }
}

/**
 * Permission state of the read and write contacts permissions, mirror the auth results that
 * abilityAccessCtrl.requestPermissionsFromUser returns.
 */
export class ContactPermissionState {
  private readGranted: boolean = false;
  private writeGranted: boolean = false;
  private lastAuthResult: number = -1;

  public applyAuthResults(readResult: number, writeResult: number): void {
    this.readGranted = readResult === 0;
    this.writeGranted = writeResult === 0;
    this.lastAuthResult = this.readGranted && this.writeGranted ? 0 : -1;
  }

  public canRead(): boolean {
    return this.readGranted;
  }

  public canWrite(): boolean {
    return this.writeGranted;
  }

  public readGrantedState(): boolean {
    return this.readGranted;
  }

  public writeGrantedState(): boolean {
    return this.writeGranted;
  }

  public reset(): void {
    this.readGranted = false;
    this.writeGranted = false;
    this.lastAuthResult = -1;
  }

  public report(): void {
    hilog.info(DOMAIN, TAG, 'contact permission read=%{public}s write=%{public}s', `${this.readGranted}`,
      `${this.writeGranted}`);
  }
}