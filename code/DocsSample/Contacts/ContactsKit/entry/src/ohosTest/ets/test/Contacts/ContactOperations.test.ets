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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  AUTH_RESULT_DENIED,
  AUTH_RESULT_GRANTED,
  AUTH_RESULT_INVALID,
  CONTACTS_PERMISSIONS,
  DELAY_AFTER_ACTION,
  ERR_CAPABILITY_NOT_SUPPORT,
  ERR_OPERATION_FAILED,
  ERR_PARAM_INVALID,
  ERR_PERMISSION_DENIED,
  FIXTURE_FULL_NAME,
  FIXTURE_PHONE,
  FIXTURE_SECOND_NAME,
  FIXTURE_SECOND_PHONE,
  PERMISSION_READ_CONTACTS,
  PERMISSION_WRITE_CONTACTS,
  SAMPLE_BUTTON_TEXTS,
  TEXT_SELECT_BY_PICKER,
  contactPageComponentCount,
  clickSampleButton,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  waitForStableContactPage,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../Shared/ContactsDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

/**
 * Mock of the contacts provider.
 *
 * The real provider is only reachable with the restricted contacts permission and it stores the
 * records of the device. Every case that verifies the request shape therefore talks to this mock
 * instead of the provider, so no contact of the device is created, changed or removed while the
 * suite runs.
 */
class MockContactService {
  private static instance: MockContactService;
  private operationLog: string[] = [];
  private storedRecords: MockContactRecord[] = [];
  private nextId: number = 1;
  private failNextWrite: boolean = false;
  private failCode: number = ERR_OPERATION_FAILED;

  public static getInstance(): MockContactService {
    if (!MockContactService.instance) {
      MockContactService.instance = new MockContactService();
    }
    return MockContactService.instance;
  }

  public async addContact(record: MockContactRecord): Promise<number> {
    this.operationLog.push(`addContact called with name: ${record.fullName}`);
    await Promise.resolve();
    if (this.failNextWrite) {
      this.failNextWrite = false;
      throw new MockBusinessError(this.failCode, 'addContact failed');
    }
    const stored: MockContactRecord = {
      id: this.nextId,
      fullName: record.fullName,
      phoneNumber: record.phoneNumber,
      email: record.email,
      organization: record.organization
    };
    this.nextId++;
    this.storedRecords.push(stored);
    return stored.id;
  }

  public async updateContact(record: MockContactRecord): Promise<boolean> {
    this.operationLog.push(`updateContact called with id: ${record.id}`);
    await Promise.resolve();
    if (this.failNextWrite) {
      this.failNextWrite = false;
      throw new MockBusinessError(this.failCode, 'updateContact failed');
    }
    for (let i = 0; i < this.storedRecords.length; i++) {
      if (this.storedRecords[i].id === record.id) {
        this.storedRecords[i].fullName = record.fullName;
        this.storedRecords[i].phoneNumber = record.phoneNumber;
        this.storedRecords[i].email = record.email;
        this.storedRecords[i].organization = record.organization;
        return true;
      }
    }
    return false;
  }

  public async selectContacts(multiSelect: boolean): Promise<MockContactRecord[]> {
    this.operationLog.push(`selectContacts called with isMultiSelect: ${multiSelect}`);
    await Promise.resolve();
    if (multiSelect) {
      return [this.storedRecords[0], this.storedRecords[1]].filter((record: MockContactRecord) => record !== undefined);
    }
    const first: MockContactRecord | undefined = this.storedRecords[0];
    return first === undefined ? [] : [first];
  }

  public scheduleFailure(code: number): void {
    this.failNextWrite = true;
    this.failCode = code;
  }

  public getStoredRecords(): MockContactRecord[] {
    return this.storedRecords.map((record: MockContactRecord) => record);
  }

  public getStoredCount(): number {
    return this.storedRecords.length;
  }

  public getOperationLog(): string[] {
    return this.operationLog.slice();
  }

  public getOperationCount(operation: string): number {
    let count: number = 0;
    for (let i = 0; i < this.operationLog.length; i++) {
      if (this.operationLog[i].indexOf(operation) === 0) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.operationLog = [];
    this.storedRecords = [];
    this.nextId = 1;
    this.failNextWrite = false;
    this.failCode = ERR_OPERATION_FAILED;
  }
}

/**
 * Failure raised by the mock, it carries the same code and message fields as the BusinessError of
 * the real contacts API so that the production error handling can be exercised unchanged.
 */
class MockBusinessError extends Error {
  public code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
    this.name = 'BusinessError';
  }
}

/**
 * Record stored by the mock provider.
 */
interface MockContactRecord {
  id: number;
  fullName: string;
  phoneNumber: string;
  email: string;
  organization: string;
}

/**
 * State of one contacts operation.
 */
enum OperationStatus {
  PENDING = 'pending',
  RUNNING = 'running',
  SUCCEEDED = 'succeeded',
  FAILED = 'failed',
  CANCELLED = 'cancelled'
}

/**
 * The four operations that pages/Index.ets exposes.
 */
enum ContactOperationKind {
  SELECT_BY_PICKER = 'selectByPicker',
  ADD_BY_PERMISSION = 'addByPermission',
  ADD_BY_PICKER = 'addByPicker',
  UPDATE_BY_PICKER = 'updateByPicker'
}

/**
 * Request of one contacts operation.
 */
interface OperationRequest {
  kind: ContactOperationKind;
  fullName: string;
  phoneNumber: string;
  multiSelect: boolean;
  contactId: number;
  requestedAt: number;
}

/**
 * Result of one contacts operation.
 */
interface OperationResult {
  kind: ContactOperationKind;
  status: OperationStatus;
  affectedId: number;
  matchedCount: number;
  elapsedMs: number;
  errorCode: number;
}

/**
 * Queue that serializes the contacts operations of the sample.
 *
 * The sample fires one provider request per button press. Pressing the buttons quickly produces
 * overlapping requests, the queue keeps them in press order and lets the cases verify that the
 * provider is never entered twice at the same time.
 */
class OperationQueue {
  private requests: OperationRequest[] = [];
  private running: boolean = false;
  private processedCount: number = 0;
  private maxPending: number = 0;

  public enqueue(request: OperationRequest): void {
    this.requests.push(request);
    if (this.requests.length > this.maxPending) {
      this.maxPending = this.requests.length;
    }
  }

  public poll(): OperationRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    const next: OperationRequest = this.requests[0];
    this.requests = this.requests.slice(1);
    this.processedCount++;
    return next;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public setRunning(running: boolean): void {
    this.running = running;
  }

  public getPendingCount(): number {
    return this.requests.length;
  }

  public getProcessedCount(): number {
    return this.processedCount;
  }

  public getMaxPending(): number {
    return this.maxPending;
  }

  public isEmpty(): boolean {
    return this.requests.length === 0;
  }

  public clear(): void {
    this.requests = [];
    this.running = false;
    this.processedCount = 0;
    this.maxPending = 0;
  }
}

/**
 * Dispatches the queued requests to the mock provider one after another.
 */
class OperationDispatcher {
  private service: MockContactService;
  private queue: OperationQueue;
  private results: OperationResult[] = [];

  constructor(service: MockContactService, queue: OperationQueue) {
    this.service = service;
    this.queue = queue;
  }

  public async dispatchAll(): Promise<OperationResult[]> {
    const produced: OperationResult[] = [];
    while (!this.queue.isEmpty()) {
      const request: OperationRequest | null = this.queue.poll();
      if (request === null) {
        break;
      }
      const result: OperationResult = await this.dispatch(request);
      produced.push(result);
      this.results.push(result);
    }
    return produced;
  }

  public async dispatch(request: OperationRequest): Promise<OperationResult> {
    const start: number = Date.now();
    this.queue.setRunning(true);
    let status: OperationStatus = OperationStatus.SUCCEEDED;
    let affectedId: number = 0;
    let matchedCount: number = 0;
    let errorCode: number = 0;
    try {
      if (request.kind === ContactOperationKind.SELECT_BY_PICKER) {
        const selected: MockContactRecord[] = await this.service.selectContacts(request.multiSelect);
        matchedCount = selected.length;
        affectedId = matchedCount > 0 ? selected[0].id : 0;
      } else if (request.kind === ContactOperationKind.ADD_BY_PERMISSION) {
        const record: MockContactRecord = {
          id: 0,
          fullName: request.fullName,
          phoneNumber: request.phoneNumber,
          email: '',
          organization: ''
        };
        affectedId = await this.service.addContact(record);
      } else if (request.kind === ContactOperationKind.ADD_BY_PICKER) {
        const record: MockContactRecord = {
          id: 0,
          fullName: request.fullName,
          phoneNumber: request.phoneNumber,
          email: '',
          organization: ''
        };
        affectedId = await this.service.addContact(record);
      } else {
        const record: MockContactRecord = {
          id: request.contactId,
          fullName: request.fullName,
          phoneNumber: request.phoneNumber,
          email: '',
          organization: ''
        };
        const updated: boolean = await this.service.updateContact(record);
        status = updated ? OperationStatus.SUCCEEDED : OperationStatus.FAILED;
        affectedId = request.contactId;
      }
    } catch (error) {
      const err: MockBusinessError = error as MockBusinessError;
      status = OperationStatus.FAILED;
      errorCode = err.code;
      hilog.warn(DOMAIN, TAG, 'dispatch: operation failed with code %{public}d', errorCode);
    } finally {
      this.queue.setRunning(false);
    }
    return {
      kind: request.kind,
      status: status,
      affectedId: affectedId,
      matchedCount: matchedCount,
      elapsedMs: Date.now() - start,
      errorCode: errorCode
    };
  }

  public getResults(): OperationResult[] {
    return this.results.slice();
  }

  public getResultsByKind(kind: ContactOperationKind): OperationResult[] {
    return this.results.filter((result: OperationResult) => result.kind === kind);
  }

  public reset(): void {
    this.results = [];
  }
}

/**
 * Aggregates the results of a batch of operations.
 */
class OperationResultAnalyzer {
  private results: OperationResult[];

  constructor(results: OperationResult[]) {
    this.results = results;
  }

  public countByStatus(status: OperationStatus): number {
    return this.results.filter((result: OperationResult) => result.status === status).length;
  }

  public successRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    return this.countByStatus(OperationStatus.SUCCEEDED) / this.results.length;
  }

  public averageElapsedMs(): number {
    if (this.results.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      total += this.results[i].elapsedMs;
    }
    return total / this.results.length;
  }

  public maxElapsedMs(): number {
    let max: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].elapsedMs > max) {
        max = this.results[i].elapsedMs;
      }
    }
    return max;
  }

  public totalMatched(): number {
    let total: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      total += this.results[i].matchedCount;
    }
    return total;
  }

  public errorCodes(): number[] {
    return this.results.filter((result: OperationResult) => result.errorCode !== 0)
      .map((result: OperationResult) => result.errorCode);
  }

  public hasFailure(): boolean {
    return this.countByStatus(OperationStatus.FAILED) > 0;
  }

  public allSucceeded(): boolean {
    return this.results.length > 0 && this.countByStatus(OperationStatus.SUCCEEDED) === this.results.length;
  }

  public summary(): string {
    return `OperationResultAnalyzer{total=${this.results.length}, ` +
      `ok=${this.countByStatus(OperationStatus.SUCCEEDED)}, ` +
      `failed=${this.countByStatus(OperationStatus.FAILED)}}`;
  }
}

/**
 * Validates the shape of an operation request.
 */
class OperationRequestValidator {
  public static readonly MAX_NAME_LENGTH: number = 128;
  public static readonly MIN_PHONE_LENGTH: number = 3;
  public static readonly MAX_PHONE_LENGTH: number = 20;

  public static isNameValid(name: string): boolean {
    if (name.length === 0 || name.length > OperationRequestValidator.MAX_NAME_LENGTH) {
      return false;
    }
    return name.trim() === name;
  }

  public static isPhoneValid(phone: string): boolean {
    if (phone.length < OperationRequestValidator.MIN_PHONE_LENGTH ||
      phone.length > OperationRequestValidator.MAX_PHONE_LENGTH) {
      return false;
    }
    for (let i = 0; i < phone.length; i++) {
      const char: string = phone.charAt(i);
      if (char < '0' || char > '9') {
        return false;
      }
    }
    return true;
  }

  public static isContactIdValid(id: number): boolean {
    return id > 0 && Number.isInteger(id);
  }

  public static isRequestValid(request: OperationRequest): boolean {
    if (request.kind === ContactOperationKind.SELECT_BY_PICKER) {
      return true;
    }
    if (request.kind === ContactOperationKind.UPDATE_BY_PICKER) {
      return OperationRequestValidator.isContactIdValid(request.contactId) &&
        OperationRequestValidator.isNameValid(request.fullName) &&
        OperationRequestValidator.isPhoneValid(request.phoneNumber);
    }
    return OperationRequestValidator.isNameValid(request.fullName) &&
      OperationRequestValidator.isPhoneValid(request.phoneNumber);
  }

  public static describe(request: OperationRequest): string {
    return `OperationRequest{kind=${request.kind}, name=${request.fullName}, ` +
      `phone=${request.phoneNumber}, id=${request.contactId}}`;
  }
}

/**
 * Builds the requests that the sample sends for the four buttons.
 */
class OperationRequestBuilder {
  private kind: ContactOperationKind = ContactOperationKind.SELECT_BY_PICKER;
  private name: string = FIXTURE_FULL_NAME;
  private phone: string = FIXTURE_PHONE;
  private multiSelect: boolean = false;
  private contactId: number = 1;

  public setKind(kind: ContactOperationKind): OperationRequestBuilder {
    this.kind = kind;
    return this;
  }

  public setName(name: string): OperationRequestBuilder {
    this.name = name;
    return this;
  }

  public setPhone(phone: string): OperationRequestBuilder {
    this.phone = phone;
    return this;
  }

  public setMultiSelect(multiSelect: boolean): OperationRequestBuilder {
    this.multiSelect = multiSelect;
    return this;
  }

  public setContactId(id: number): OperationRequestBuilder {
    this.contactId = id;
    return this;
  }

  public build(): OperationRequest {
    return {
      kind: this.kind,
      fullName: this.name,
      phoneNumber: this.phone,
      multiSelect: this.multiSelect,
      contactId: this.contactId,
      requestedAt: Date.now()
    };
  }

  public static forSelect(multiSelect: boolean): OperationRequest {
    return new OperationRequestBuilder()
      .setKind(ContactOperationKind.SELECT_BY_PICKER)
      .setMultiSelect(multiSelect)
      .build();
  }

  public static forAddByPermission(name: string, phone: string): OperationRequest {
    return new OperationRequestBuilder()
      .setKind(ContactOperationKind.ADD_BY_PERMISSION)
      .setName(name)
      .setPhone(phone)
      .build();
  }

  public static forAddByPicker(name: string, phone: string): OperationRequest {
    return new OperationRequestBuilder()
      .setKind(ContactOperationKind.ADD_BY_PICKER)
      .setName(name)
      .setPhone(phone)
      .build();
  }

  public static forUpdate(id: number, name: string, phone: string): OperationRequest {
    return new OperationRequestBuilder()
      .setKind(ContactOperationKind.UPDATE_BY_PICKER)
      .setContactId(id)
      .setName(name)
      .setPhone(phone)
      .build();
  }
}

/**
 * Generates the identifiers that the sample logs for a request.
 */
class OperationIdGenerator {
  private static sequence: number = 0;
  private prefix: string;

  constructor(prefix: string = 'contact-op') {
    this.prefix = prefix;
  }

  public next(): string {
    OperationIdGenerator.sequence++;
    return `${this.prefix}-${OperationIdGenerator.sequence}`;
  }

  public static peek(): number {
    return OperationIdGenerator.sequence;
  }

  public static reset(): void {
    OperationIdGenerator.sequence = 0;
  }

  public static format(id: number): string {
    return id < 10 ? `00${id}` : (id < 100 ? `0${id}` : `${id}`);
  }
}

/**
 * Formats the operation log lines that the cases compare.
 */
class OperationLogFormatter {
  public static formatResult(result: OperationResult): string {
    return `[${result.kind}] status=${result.status} id=${result.affectedId} ` +
      `matched=${result.matchedCount} error=${result.errorCode}`;
  }

  public static formatRequest(request: OperationRequest): string {
    return `[${request.kind}] name=${request.fullName} phone=${request.phoneNumber} ` +
      `multi=${request.multiSelect}`;
  }

  public static formatQueue(queue: OperationQueue): string {
    return `queue{pending=${queue.getPendingCount()}, processed=${queue.getProcessedCount()}}`;
  }

  public static joinResults(results: OperationResult[]): string {
    const parts: string[] = results.map((result: OperationResult) => OperationLogFormatter.formatResult(result));
    return parts.join(' | ');
  }
}

/**
 * Verifies the permission semantics that the sample documents.
 */
class PermissionSemanticsValidator {
  public static isGranted(authResult: number): boolean {
    return authResult === AUTH_RESULT_GRANTED;
  }

  public static isDenied(authResult: number): boolean {
    return authResult === AUTH_RESULT_DENIED;
  }

  public static isInvalid(authResult: number): boolean {
    return authResult === AUTH_RESULT_INVALID;
  }

  public static allGranted(authResults: number[]): boolean {
    for (let i = 0; i < authResults.length; i++) {
      if (!PermissionSemanticsValidator.isGranted(authResults[i])) {
        return false;
      }
    }
    return authResults.length > 0;
  }

  public static grantedCount(authResults: number[]): number {
    return authResults.filter((result: number) => result === AUTH_RESULT_GRANTED).length;
  }

  public static deniedPermissions(authResults: number[], permissions: string[]): string[] {
    const denied: string[] = [];
    for (let i = 0; i < authResults.length && i < permissions.length; i++) {
      if (!PermissionSemanticsValidator.isGranted(authResults[i])) {
        denied.push(permissions[i]);
      }
    }
    return denied;
  }

  public static writePermissionNeedsReadPermission(granted: string[]): boolean {
    const hasWrite: boolean = granted.indexOf(PERMISSION_WRITE_CONTACTS) >= 0;
    const hasRead: boolean = granted.indexOf(PERMISSION_READ_CONTACTS) >= 0;
    if (hasWrite && !hasRead) {
      return false;
    }
    return true;
  }

  public static readonly SUPPORTED_PERMISSIONS: string[] = CONTACTS_PERMISSIONS;
}

/**
 * Classifies a business error code of the contacts APIs.
 */
class ContactErrorClassifier {
  public static isPermissionError(code: number): boolean {
    return code === ERR_PERMISSION_DENIED;
  }

  public static isParamError(code: number): boolean {
    return code === ERR_PARAM_INVALID;
  }

  public static isCapabilityError(code: number): boolean {
    return code === ERR_CAPABILITY_NOT_SUPPORT;
  }

  public static isOperationError(code: number): boolean {
    return code === ERR_OPERATION_FAILED;
  }

  public static isDocumented(code: number): boolean {
    return ContactErrorClassifier.isPermissionError(code) || ContactErrorClassifier.isParamError(code) ||
      ContactErrorClassifier.isCapabilityError(code) || ContactErrorClassifier.isOperationError(code);
  }

  public static isRetryable(code: number): boolean {
    return ContactErrorClassifier.isOperationError(code);
  }

  public static labelOf(code: number): string {
    if (ContactErrorClassifier.isPermissionError(code)) {
      return 'PERMISSION_DENIED';
    }
    if (ContactErrorClassifier.isParamError(code)) {
      return 'PARAM_INVALID';
    }
    if (ContactErrorClassifier.isCapabilityError(code)) {
      return 'CAPABILITY_NOT_SUPPORT';
    }
    if (ContactErrorClassifier.isOperationError(code)) {
      return 'OPERATION_FAILED';
    }
    return 'UNKNOWN';
  }
}

export default function contactOperationsTest(): void {
  describe('ContactOperations_Test', () => {
    let driver: Driver;
    let service: MockContactService;
    let queue: OperationQueue;
    let dispatcher: OperationDispatcher;

    beforeAll(async () => {
      driver = getDriver();
      service = MockContactService.getInstance();
      service.reset();
      queue = new OperationQueue();
      dispatcher = new OperationDispatcher(service, queue);
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: add a contact through the restricted open API.
     * Expectation: the provider stores one record and reports the identifier it assigned.
     */
    it('contact_operations_add_by_permission_should_store_record', 0, async () => {
      service.reset();
      queue.clear();
      const request: OperationRequest = OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE);
      const result: OperationResult = await dispatcher.dispatch(request);
      expect(result.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(result.affectedId).assertLarger(0);
      expect(result.errorCode).assertEqual(0);
      expect(service.getStoredCount()).assertEqual(1);
      expect(service.getStoredRecords()[0].fullName).assertEqual(FIXTURE_FULL_NAME);
      expect(service.getStoredRecords()[0].phoneNumber).assertEqual(FIXTURE_PHONE);
    });

    /**
     * Scenario: add a contact through the picker flow.
     * Expectation: the same provider entry point is used and the record is stored.
     */
    it('contact_operations_add_by_picker_should_store_record', 0, async () => {
      service.reset();
      queue.clear();
      const request: OperationRequest = OperationRequestBuilder.forAddByPicker(FIXTURE_SECOND_NAME,
        FIXTURE_SECOND_PHONE);
      const result: OperationResult = await dispatcher.dispatch(request);
      expect(result.kind).assertEqual(ContactOperationKind.ADD_BY_PICKER);
      expect(result.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(service.getStoredCount()).assertEqual(1);
      expect(service.getStoredRecords()[0].phoneNumber).assertEqual(FIXTURE_SECOND_PHONE);
    });

    /**
     * Scenario: update a contact that exists.
     * Expectation: the record keeps its identifier and carries the new name.
     */
    it('contact_operations_update_existing_should_succeed', 0, async () => {
      service.reset();
      queue.clear();
      const added: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      const updateRequest: OperationRequest = OperationRequestBuilder.forUpdate(added.affectedId,
        FIXTURE_SECOND_NAME, FIXTURE_SECOND_PHONE);
      const updated: OperationResult = await dispatcher.dispatch(updateRequest);
      expect(updated.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(updated.affectedId).assertEqual(added.affectedId);
      const stored: MockContactRecord[] = service.getStoredRecords();
      expect(stored.length).assertEqual(1);
      expect(stored[0].fullName).assertEqual(FIXTURE_SECOND_NAME);
    });

    /**
     * Scenario: update a contact that does not exist.
     * Expectation: the operation reports failure without touching the stored records.
     */
    it('contact_operations_update_missing_should_fail', 0, async () => {
      service.reset();
      queue.clear();
      const request: OperationRequest = OperationRequestBuilder.forUpdate(99, FIXTURE_FULL_NAME, FIXTURE_PHONE);
      const result: OperationResult = await dispatcher.dispatch(request);
      expect(result.status).assertEqual(OperationStatus.FAILED);
      expect(service.getStoredCount()).assertEqual(0);
    });

    /**
     * Scenario: select contacts with a single selection.
     * Expectation: the picker request asks for a single result.
     */
    it('contact_operations_select_single_should_request_single_result', 0, async () => {
      service.reset();
      queue.clear();
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPermission(FIXTURE_SECOND_NAME, FIXTURE_SECOND_PHONE));
      const result: OperationResult = await dispatcher.dispatch(OperationRequestBuilder.forSelect(false));
      expect(result.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(result.matchedCount).assertEqual(1);
      expect(service.getOperationLog()[2]).assertContain('isMultiSelect: false');
    });

    /**
     * Scenario: select contacts with a multi selection.
     * Expectation: the picker request asks for every selected result.
     */
    it('contact_operations_select_multi_should_request_all_results', 0, async () => {
      service.reset();
      queue.clear();
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPermission(FIXTURE_SECOND_NAME, FIXTURE_SECOND_PHONE));
      const result: OperationResult = await dispatcher.dispatch(OperationRequestBuilder.forSelect(true));
      expect(result.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(result.matchedCount).assertEqual(2);
      expect(service.getOperationLog()[2]).assertContain('isMultiSelect: true');
    });

    /**
     * Scenario: the provider rejects the write with the permission error.
     * Expectation: the result carries the code and the operation is reported as failed.
     */
    it('contact_operations_permission_failure_should_be_reported', 0, async () => {
      service.reset();
      queue.clear();
      service.scheduleFailure(ERR_PERMISSION_DENIED);
      const result: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(result.status).assertEqual(OperationStatus.FAILED);
      expect(result.errorCode).assertEqual(ERR_PERMISSION_DENIED);
      expect(ContactErrorClassifier.isPermissionError(result.errorCode)).assertTrue();
      expect(service.getStoredCount()).assertEqual(0);
    });

    /**
     * Scenario: the provider rejects the write with the parameter error.
     * Expectation: the classifier maps the code to the parameter category.
     */
    it('contact_operations_param_failure_should_be_classified', 0, async () => {
      service.reset();
      queue.clear();
      service.scheduleFailure(ERR_PARAM_INVALID);
      const result: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(result.errorCode).assertEqual(ERR_PARAM_INVALID);
      expect(ContactErrorClassifier.isParamError(result.errorCode)).assertTrue();
      expect(ContactErrorClassifier.isRetryable(result.errorCode)).assertFalse();
    });

    /**
     * Scenario: the provider reports an operation error.
     * Expectation: the error is classified as retryable.
     */
    it('contact_operations_operation_error_should_be_retryable', 0, async () => {
      service.reset();
      queue.clear();
      service.scheduleFailure(ERR_OPERATION_FAILED);
      const result: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(result.status).assertEqual(OperationStatus.FAILED);
      expect(ContactErrorClassifier.isOperationError(result.errorCode)).assertTrue();
      expect(ContactErrorClassifier.isRetryable(result.errorCode)).assertTrue();
    });

    /**
     * Scenario: a batch with every operation kind is dispatched.
     * Expectation: the analyzer reports one success per request.
     */
    it('contact_operations_batch_should_succeed_for_every_kind', 0, async () => {
      service.reset();
      queue.clear();
      dispatcher.reset();
      queue.enqueue(OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      queue.enqueue(OperationRequestBuilder.forAddByPicker(FIXTURE_SECOND_NAME, FIXTURE_SECOND_PHONE));
      queue.enqueue(OperationRequestBuilder.forSelect(true));
      const results: OperationResult[] = await dispatcher.dispatchAll();
      expect(results.length).assertEqual(4);
      const analyzer: OperationResultAnalyzer = new OperationResultAnalyzer(results);
      expect(analyzer.allSucceeded()).assertTrue();
      expect(analyzer.successRate()).assertEqual(1);
      expect(analyzer.summary()).assertContain('ok=4');
    });

    /**
     * Scenario: the queue drains while the dispatcher processes it.
     * Expectation: every queued request is processed exactly once.
     */
    it('contact_operations_queue_should_process_every_request', 0, async () => {
      service.reset();
      queue.clear();
      dispatcher.reset();
      for (let i = 0; i < 10; i++) {
        queue.enqueue(OperationRequestBuilder.forAddByPermission(`Name${i}`, `1390000${i}000`));
      }
      expect(queue.getPendingCount()).assertEqual(10);
      await dispatcher.dispatchAll();
      expect(queue.getPendingCount()).assertEqual(0);
      expect(queue.getProcessedCount()).assertEqual(10);
      expect(service.getStoredCount()).assertEqual(10);
    });

    /**
     * Scenario: the queue is observed while the requests are enqueued.
     * Expectation: the peak pending count matches the burst size.
     */
    it('contact_operations_queue_should_track_peak_pending', 0, async () => {
      queue.clear();
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      expect(queue.getMaxPending()).assertEqual(3);
      expect(queue.isRunning()).assertFalse();
      queue.setRunning(true);
      expect(queue.isRunning()).assertTrue();
      queue.setRunning(false);
      expect(queue.isRunning()).assertFalse();
    });

    /**
     * Scenario: request validation of the documented contact fields.
     * Expectation: an empty name and a non numeric phone are rejected.
     */
    it('contact_operations_request_validator_should_reject_bad_fields', 0, async () => {
      expect(OperationRequestValidator.isNameValid('')).assertFalse();
      expect(OperationRequestValidator.isNameValid(FIXTURE_FULL_NAME)).assertTrue();
      expect(OperationRequestValidator.isPhoneValid('')).assertFalse();
      expect(OperationRequestValidator.isPhoneValid('abc')).assertFalse();
      expect(OperationRequestValidator.isPhoneValid(FIXTURE_PHONE)).assertTrue();
      expect(OperationRequestValidator.isContactIdValid(0)).assertFalse();
      expect(OperationRequestValidator.isContactIdValid(1)).assertTrue();
    });

    /**
     * Scenario: validate the requests built for the four buttons.
     * Expectation: the select request needs no contact field, the update request needs an id.
     */
    it('contact_operations_request_validator_should_accept_sample_requests', 0, async () => {
      expect(OperationRequestValidator.isRequestValid(OperationRequestBuilder.forSelect(false))).assertTrue();
      expect(OperationRequestValidator.isRequestValid(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE))).assertTrue();
      expect(OperationRequestValidator.isRequestValid(
        OperationRequestBuilder.forUpdate(0, FIXTURE_FULL_NAME, FIXTURE_PHONE))).assertFalse();
      expect(OperationRequestValidator.isRequestValid(
        OperationRequestBuilder.forUpdate(1, FIXTURE_FULL_NAME, FIXTURE_PHONE))).assertTrue();
      const described: string = OperationRequestValidator.describe(
        OperationRequestBuilder.forSelect(false));
      expect(described).assertContain('selectByPicker');
    });

    /**
     * Scenario: permission results of the requestPermissionsFromUser call.
     * Expectation: only the zero auth result counts as a grant.
     */
    it('contact_operations_permission_validator_should_require_zero_auth_result', 0, async () => {
      expect(PermissionSemanticsValidator.isGranted(AUTH_RESULT_GRANTED)).assertTrue();
      expect(PermissionSemanticsValidator.isGranted(AUTH_RESULT_DENIED)).assertFalse();
      expect(PermissionSemanticsValidator.isGranted(AUTH_RESULT_INVALID)).assertFalse();
      expect(PermissionSemanticsValidator.allGranted([0, 0])).assertTrue();
      expect(PermissionSemanticsValidator.allGranted([0, -1])).assertFalse();
      expect(PermissionSemanticsValidator.allGranted([])).assertFalse();
    });

    /**
     * Scenario: one of the two requested permissions is denied.
     * Expectation: the denied permission is reported by name.
     */
    it('contact_operations_permission_validator_should_name_denied_permission', 0, async () => {
      const denied: string[] = PermissionSemanticsValidator.deniedPermissions([0, -1], CONTACTS_PERMISSIONS);
      expect(denied.length).assertEqual(1);
      expect(denied[0]).assertEqual(PERMISSION_WRITE_CONTACTS);
      expect(PermissionSemanticsValidator.grantedCount([0, 0])).assertEqual(2);
      expect(PermissionSemanticsValidator.grantedCount([-1, -1])).assertEqual(0);
    });

    /**
     * Scenario: the granted permission set carries the write permission without the read one.
     * Expectation: the validator reports an inconsistent set.
     */
    it('contact_operations_permission_validator_should_reject_write_without_read', 0, async () => {
      expect(PermissionSemanticsValidator.writePermissionNeedsReadPermission([PERMISSION_WRITE_CONTACTS]))
        .assertFalse();
      expect(PermissionSemanticsValidator.writePermissionNeedsReadPermission(
        [PERMISSION_READ_CONTACTS, PERMISSION_WRITE_CONTACTS])).assertTrue();
      expect(PermissionSemanticsValidator.writePermissionNeedsReadPermission([PERMISSION_READ_CONTACTS]))
        .assertTrue();
    });

    /**
     * Scenario: the operation identifier generator produces unique identifiers.
     * Expectation: the sequence moves forward and the padded format is stable.
     */
    it('contact_operations_id_generator_should_produce_unique_ids', 0, async () => {
      OperationIdGenerator.reset();
      const generator: OperationIdGenerator = new OperationIdGenerator('case');
      const first: string = generator.next();
      const second: string = generator.next();
      expect(first === second).assertFalse();
      expect(first).assertContain('case-');
      expect(OperationIdGenerator.peek()).assertEqual(2);
      expect(OperationIdGenerator.format(7)).assertEqual('007');
      expect(OperationIdGenerator.format(42)).assertEqual('042');
      expect(OperationIdGenerator.format(123)).assertEqual('123');
    });

    /**
     * Scenario: format the result and request lines of the sample log.
     * Expectation: the lines carry the fields that the hilog output shows.
     */
    it('contact_operations_log_formatter_should_include_fields', 0, async () => {
      const result: OperationResult = {
        kind: ContactOperationKind.ADD_BY_PERMISSION,
        status: OperationStatus.SUCCEEDED,
        affectedId: 3,
        matchedCount: 0,
        elapsedMs: 12,
        errorCode: 0
      };
      const line: string = OperationLogFormatter.formatResult(result);
      expect(line).assertContain('addByPermission');
      expect(line).assertContain('succeeded');
      expect(line).assertContain('id=3');
      const requestLine: string = OperationLogFormatter.formatRequest(
        OperationRequestBuilder.forSelect(true));
      expect(requestLine).assertContain('multi=true');
      expect(OperationLogFormatter.joinResults([result, result])).assertContain('|');
    });

    /**
     * Scenario: the analyzer summarizes a mixed batch.
     * Expectation: the failed count and the error codes are reported.
     */
    it('contact_operations_analyzer_should_summarize_mixed_batch', 0, async () => {
      const results: OperationResult[] = [{
        kind: ContactOperationKind.ADD_BY_PERMISSION,
        status: OperationStatus.SUCCEEDED,
        affectedId: 1,
        matchedCount: 0,
        elapsedMs: 5,
        errorCode: 0
      }, {
        kind: ContactOperationKind.UPDATE_BY_PICKER,
        status: OperationStatus.FAILED,
        affectedId: 1,
        matchedCount: 0,
        elapsedMs: 7,
        errorCode: ERR_PERMISSION_DENIED
      }];
      const analyzer: OperationResultAnalyzer = new OperationResultAnalyzer(results);
      expect(analyzer.hasFailure()).assertTrue();
      expect(analyzer.allSucceeded()).assertFalse();
      expect(analyzer.errorCodes().length).assertEqual(1);
      expect(analyzer.errorCodes()[0]).assertEqual(ERR_PERMISSION_DENIED);
      expect(analyzer.averageElapsedMs()).assertEqual(6);
      expect(analyzer.maxElapsedMs()).assertEqual(7);
    });

    /**
     * Scenario: the analyzer handles an empty batch.
     * Expectation: the averages return zero instead of dividing by zero.
     */
    it('contact_operations_analyzer_should_handle_empty_batch', 0, async () => {
      const analyzer: OperationResultAnalyzer = new OperationResultAnalyzer([]);
      expect(analyzer.successRate()).assertEqual(0);
      expect(analyzer.averageElapsedMs()).assertEqual(0);
      expect(analyzer.maxElapsedMs()).assertEqual(0);
      expect(analyzer.totalMatched()).assertEqual(0);
      expect(analyzer.allSucceeded()).assertFalse();
    });

    /**
     * Scenario: dispatch a request through the sample page.
     * Expectation: the page is still rendered after the operation card is used.
     */
    it('contact_operations_page_should_survive_operation_card', 0, async () => {
      const pageReady: boolean = await ensureContactsPage(driver);
      expect(pageReady).assertTrue();
      await waitForStableContactPage(driver);
      const before: number = await contactPageComponentCount(driver);
      expect(before).assertLargerOrEqual(1);
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_ACTION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_ACTION);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    /**
     * Scenario: the sample renders every button label.
     * Expectation: the label list of the driver stays in sync with the page.
     */
    it('contact_operations_sample_buttons_should_be_declared', 0, async () => {
      expect(SAMPLE_BUTTON_TEXTS.length).assertEqual(4);
      expect(SAMPLE_BUTTON_TEXTS[0]).assertContain('Picker');
      expect(SAMPLE_BUTTON_TEXTS[1]).assertContain('API');
      expect(SAMPLE_BUTTON_TEXTS[2]).assertContain('picker');
      expect(SAMPLE_BUTTON_TEXTS[3]).assertContain('更新');
    });

    /**
     * Scenario: the service records every provider entry.
     * Expectation: the operation count per entry point matches the dispatched batch.
     */
    it('contact_operations_service_should_record_every_entry', 0, async () => {
      service.reset();
      queue.clear();
      dispatcher.reset();
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      await dispatcher.dispatch(OperationRequestBuilder.forAddByPicker(FIXTURE_SECOND_NAME, FIXTURE_SECOND_PHONE));
      await dispatcher.dispatch(OperationRequestBuilder.forUpdate(1, FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(service.getOperationCount('addContact')).assertEqual(2);
      expect(service.getOperationCount('updateContact')).assertEqual(1);
      expect(service.getOperationLog().length).assertEqual(3);
    });

    /**
     * Scenario: a failed write does not leave a half stored record behind.
     * Expectation: the stored count stays unchanged after the failure.
     */
    it('contact_operations_failed_write_should_not_store_partial_record', 0, async () => {
      service.reset();
      queue.clear();
      service.scheduleFailure(ERR_OPERATION_FAILED);
      const result: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(result.status).assertEqual(OperationStatus.FAILED);
      expect(service.getStoredCount()).assertEqual(0);
      const retry: OperationResult = await dispatcher.dispatch(
        OperationRequestBuilder.forAddByPermission(FIXTURE_FULL_NAME, FIXTURE_PHONE));
      expect(retry.status).assertEqual(OperationStatus.SUCCEEDED);
      expect(service.getStoredCount()).assertEqual(1);
    });

    /**
     * Scenario: classify every documented error code.
     * Expectation: each code reports its own label and the unknown code is rejected.
     */
    it('contact_operations_error_classifier_should_cover_documented_codes', 0, async () => {
      expect(ContactErrorClassifier.isDocumented(ERR_PERMISSION_DENIED)).assertTrue();
      expect(ContactErrorClassifier.isDocumented(ERR_PARAM_INVALID)).assertTrue();
      expect(ContactErrorClassifier.isDocumented(ERR_CAPABILITY_NOT_SUPPORT)).assertTrue();
      expect(ContactErrorClassifier.isDocumented(ERR_OPERATION_FAILED)).assertTrue();
      expect(ContactErrorClassifier.isDocumented(123456)).assertFalse();
      expect(ContactErrorClassifier.labelOf(ERR_PERMISSION_DENIED)).assertEqual('PERMISSION_DENIED');
      expect(ContactErrorClassifier.labelOf(ERR_CAPABILITY_NOT_SUPPORT)).assertEqual('CAPABILITY_NOT_SUPPORT');
      expect(ContactErrorClassifier.labelOf(123456)).assertEqual('UNKNOWN');
    });

    /**
     * Scenario: the queue is cleared between cases.
     * Expectation: the counters restart from zero.
     */
    it('contact_operations_queue_reset_should_clear_counters', 0, async () => {
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      queue.enqueue(OperationRequestBuilder.forSelect(false));
      expect(queue.getPendingCount()).assertEqual(2);
      queue.clear();
      expect(queue.getPendingCount()).assertEqual(0);
      expect(queue.getProcessedCount()).assertEqual(0);
      expect(queue.getMaxPending()).assertEqual(0);
      expect(queue.isEmpty()).assertTrue();
    });
  });
}
