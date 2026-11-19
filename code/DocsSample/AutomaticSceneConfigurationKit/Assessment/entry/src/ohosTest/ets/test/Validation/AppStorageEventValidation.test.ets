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
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  pressAndWait,
  textFrequency
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// AppStorage keys published by AssessmentController, the literal values must stay in sync
// with AssessmentConstants of the sample.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_DURATION: string = 'assessmentDuration';
const KEY_LOGS: string = 'assessmentLogs';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';

// Event type constants of the callback pipeline.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

const MAX_EVENT_LOG: number = 20;

/**
 * Type of a stored value.
 */
enum ValueKind {
  BOOLEAN = 'boolean',
  NUMBER = 'number',
  STRING = 'string',
  STRING_ARRAY = 'string[]',
  UNKNOWN = 'unknown'
}

/**
 * Callback event types the controller publishes.
 */
enum EventType {
  BEGIN = 'onBegin',
  INTERRUPTED = 'onInterrupted',
  END = 'onEnd',
  API_ERROR = 'onApiError',
  UNKNOWN = 'unknown'
}

/**
 * Observation phase of a publish operation.
 */
enum PublishStage {
  APPEND_LOG = 'append_log',
  SET_TYPE = 'set_type',
  SET_CODE = 'set_code',
  SET_MESSAGE = 'set_message',
  INCREMENT_SEQ = 'increment_seq',
  COMPLETE = 'complete'
}

/**
 * One stored value together with its declared kind.
 */
interface StoredValue {
  key: string;
  kind: ValueKind;
  text: string;
  number: number;
  flag: boolean;
  list: string[];
}

/**
 * One publish record of the event pipeline.
 */
interface PublishRecord {
  stage: PublishStage;
  type: string;
  code: number;
  message: string;
  seq: number;
  timestamp: number;
}

/**
 * Snapshot of the published state.
 */
interface PublishedSnapshot {
  active: boolean;
  duration: number;
  eventType: string;
  eventCode: number;
  eventMessage: string;
  seq: number;
  logCount: number;
}

/**
 * Description of one AppStorage key.
 */
interface KeyDescriptor {
  key: string;
  kind: ValueKind;
  description: string;
}

/**
 * A simulated AppStorage store.
 *
 * The real AppStorage is a process wide singleton, so the model cases cannot rely on it
 * without interfering with the sample. This store reproduces the get and set semantics the
 * controller depends on, and it is entirely local to the suite.
 */
class SimulatedAppStorage {
  private booleans: Map<string, boolean> = new Map<string, boolean>();
  private numbers: Map<string, number> = new Map<string, number>();
  private strings: Map<string, string> = new Map<string, string>();
  private arrays: Map<string, string[]> = new Map<string, string[]>();
  private writes: number = 0;
  private reads: number = 0;

  public setBoolean(key: string, value: boolean): void {
    this.booleans.set(key, value);
    this.writes++;
  }

  public setNumber(key: string, value: number): void {
    this.numbers.set(key, value);
    this.writes++;
  }

  public setString(key: string, value: string): void {
    this.strings.set(key, value);
    this.writes++;
  }

  // The controller always stores a fresh copy of the log list, the store mirrors that so a
  // caller cannot mutate the stored list through the reference it passed in.
  public setStringArray(key: string, value: string[]): void {
    this.arrays.set(key, value.slice());
    this.writes++;
  }

  public getBoolean(key: string): boolean | undefined {
    this.reads++;
    return this.booleans.get(key);
  }

  public getNumber(key: string): number | undefined {
    this.reads++;
    return this.numbers.get(key);
  }

  public getString(key: string): string | undefined {
    this.reads++;
    return this.strings.get(key);
  }

  public getStringArray(key: string): string[] | undefined {
    this.reads++;
    const value: string[] | undefined = this.arrays.get(key);
    return value === undefined ? undefined : value.slice();
  }

  public has(key: string): boolean {
    return this.booleans.has(key) || this.numbers.has(key) || this.strings.has(key) || this.arrays.has(key);
  }

  public kindOf(key: string): ValueKind {
    if (this.booleans.has(key)) {
      return ValueKind.BOOLEAN;
    }
    if (this.numbers.has(key)) {
      return ValueKind.NUMBER;
    }
    if (this.strings.has(key)) {
      return ValueKind.STRING;
    }
    if (this.arrays.has(key)) {
      return ValueKind.STRING_ARRAY;
    }
    return ValueKind.UNKNOWN;
  }

  public remove(key: string): boolean {
    const present: boolean = this.has(key);
    this.booleans.delete(key);
    this.numbers.delete(key);
    this.strings.delete(key);
    this.arrays.delete(key);
    return present;
  }

  public clear(): void {
    this.booleans.clear();
    this.numbers.clear();
    this.strings.clear();
    this.arrays.clear();
    this.writes = 0;
    this.reads = 0;
  }

  public keyCount(): number {
    return this.booleans.size + this.numbers.size + this.strings.size + this.arrays.size;
  }

  public getWrites(): number {
    return this.writes;
  }

  public getReads(): number {
    return this.reads;
  }

  public allKeys(): string[] {
    const keys: string[] = [];
    this.booleans.forEach((value: boolean, key: string) => {
      keys.push(key);
    });
    this.numbers.forEach((value: number, key: string) => {
      keys.push(key);
    });
    this.strings.forEach((value: string, key: string) => {
      keys.push(key);
    });
    this.arrays.forEach((value: string[], key: string) => {
      keys.push(key);
    });
    return keys;
  }

  public duplicatedAcrossKinds(): string[] {
    const result: string[] = [];
    const seen: Map<string, number> = new Map<string, number>();
    const keys: string[] = this.allKeys();
    for (let i = 0; i < keys.length; i++) {
      const count: number = seen.get(keys[i]) ?? 0;
      seen.set(keys[i], count + 1);
    }
    seen.forEach((count: number, key: string) => {
      if (count > 1) {
        result.push(key);
      }
    });
    return result;
  }

  public describe(): string {
    return `SimulatedAppStorage{keys=${this.keyCount()}, writes=${this.writes}, reads=${this.reads}}`;
  }
}

/**
 * The schema of the AppStorage keys the sample relies on.
 */
class StorageSchema {
  private descriptors: KeyDescriptor[] = [
    {
      key: KEY_ACTIVE,
      kind: ValueKind.BOOLEAN,
      description: 'whether the device is in assessment mode'
    },
    {
      key: KEY_DURATION,
      kind: ValueKind.NUMBER,
      description: 'the duration of the current assessment session'
    },
    {
      key: KEY_LOGS,
      kind: ValueKind.STRING_ARRAY,
      description: 'the callback event log, newest entry first'
    },
    {
      key: KEY_EVENT_TYPE,
      kind: ValueKind.STRING,
      description: 'the type of the last callback event'
    },
    {
      key: KEY_EVENT_CODE,
      kind: ValueKind.NUMBER,
      description: 'the code of the last callback event'
    },
    {
      key: KEY_EVENT_MESSAGE,
      kind: ValueKind.STRING,
      description: 'the message of the last callback event'
    },
    {
      key: KEY_EVENT_SEQ,
      kind: ValueKind.NUMBER,
      description: 'the monotonic sequence of the published events'
    }
  ];

  public all(): KeyDescriptor[] {
    return this.descriptors.slice();
  }

  public count(): number {
    return this.descriptors.length;
  }

  public find(key: string): KeyDescriptor | undefined {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].key === key) {
        return this.descriptors[i];
      }
    }
    return undefined;
  }

  public expectedKind(key: string): ValueKind {
    const descriptor: KeyDescriptor | undefined = this.find(key);
    return descriptor === undefined ? ValueKind.UNKNOWN : descriptor.kind;
  }

  public keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      result.push(this.descriptors[i].key);
    }
    return result;
  }

  public keysOfKind(kind: ValueKind): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].kind === kind) {
        result.push(this.descriptors[i].key);
      }
    }
    return result;
  }

  public countOfKind(kind: ValueKind): number {
    return this.keysOfKind(kind).length;
  }

  public hasUniqueKeys(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.descriptors.length; i++) {
      if (seen.has(this.descriptors[i].key)) {
        return false;
      }
      seen.add(this.descriptors[i].key);
    }
    return true;
  }

  public everyKeyPrefixed(prefix: string): boolean {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (!this.descriptors[i].key.startsWith(prefix)) {
        return false;
      }
    }
    return true;
  }

  public everyDescriptionPresent(): boolean {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].description.length === 0) {
        return false;
      }
    }
    return true;
  }

  // Verifies that the stored kinds match the schema, it is the completeness check of the
  // publishing contract.
  public matches(store: SimulatedAppStorage): boolean {
    for (let i = 0; i < this.descriptors.length; i++) {
      const descriptor: KeyDescriptor = this.descriptors[i];
      if (!store.has(descriptor.key)) {
        return false;
      }
      if (store.kindOf(descriptor.key) !== descriptor.kind) {
        return false;
      }
    }
    return true;
  }
}

/**
 * The event log with the cape and ordering rules of AssessmentController.appendLog.
 */
class EventJournal {
  private entries: string[] = [];
  private drops: number = 0;
  private appends: number = 0;

  public append(text: string): void {
    const logs: string[] = this.entries.slice();
    logs.unshift(text);
    if (logs.length > MAX_EVENT_LOG) {
      logs.pop();
      this.drops++;
    }
    this.entries = logs;
    this.appends++;
  }

  public entriesList(): string[] {
    return this.entries.slice();
  }

  public size(): number {
    return this.entries.length;
  }

  public newest(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[0];
  }

  public oldest(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }

  public getDrops(): number {
    return this.drops;
  }

  public getAppends(): number {
    return this.appends;
  }

  public clear(): void {
    this.entries = [];
    this.drops = 0;
    this.appends = 0;
  }

  public contains(text: string): boolean {
    return this.entries.indexOf(text) >= 0;
  }

  public isDescendingBySeq(): boolean {
    for (let i = 1; i < this.entries.length; i++) {
      const previous: number = this.seqOf(this.entries[i - 1]);
      const current: number = this.seqOf(this.entries[i]);
      if (current > previous) {
        return false;
      }
    }
    return true;
  }

  private seqOf(text: string): number {
    const marker: string = 'seq=';
    const index: number = text.indexOf(marker);
    if (index < 0) {
      return -1;
    }
    return Number(text.substring(index + marker.length));
  }

  public entryAt(index: number): string {
    if (index < 0 || index >= this.entries.length) {
      return '';
    }
    return this.entries[index];
  }
}

/**
 * Publisher that mirrors AssessmentController.publishEvent.
 */
class EventPublisher {
  private store: SimulatedAppStorage;
  private log: EventJournal;
  private records: PublishRecord[] = [];

  public constructor(store: SimulatedAppStorage, log: EventJournal) {
    this.store = store;
    this.log = log;
  }

  // The pipeline is deliberately ordered: the log is appended first, then the event type,
  // code and message are published, and only then the sequence is incremented.
  public publish(type: string, code: number, message: string): number {
    const seqBefore: number = this.store.getNumber(KEY_EVENT_SEQ) ?? 0;
    const seq: number = seqBefore + 1;
    this.record(PublishStage.APPEND_LOG, type, code, message, seqBefore);
    this.log.append(`${type} code=${code} message=${message} seq=${seq}`);
    this.store.setStringArray(KEY_LOGS, this.log.entriesList());
    this.record(PublishStage.SET_TYPE, type, code, message, seqBefore);
    this.store.setString(KEY_EVENT_TYPE, type);
    this.record(PublishStage.SET_CODE, type, code, message, seqBefore);
    this.store.setNumber(KEY_EVENT_CODE, code);
    this.record(PublishStage.SET_MESSAGE, type, code, message, seqBefore);
    this.store.setString(KEY_EVENT_MESSAGE, message);
    this.record(PublishStage.INCREMENT_SEQ, type, code, message, seq);
    this.store.setNumber(KEY_EVENT_SEQ, seq);
    this.record(PublishStage.COMPLETE, type, code, message, seq);
    return seq;
  }

  public setActive(active: boolean): void {
    this.store.setBoolean(KEY_ACTIVE, active);
  }

  public setDuration(duration: number): void {
    this.store.setNumber(KEY_DURATION, duration);
  }

  public getRecords(): PublishRecord[] {
    return this.records.slice();
  }

  public getStageOrder(): PublishStage[] {
    const stages: PublishStage[] = [];
    for (let i = 0; i < this.records.length; i++) {
      stages.push(this.records[i].stage);
    }
    return stages;
  }

  public countOf(stage: PublishStage): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].stage === stage) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.records = [];
  }

  public snapshot(): PublishedSnapshot {
    return {
      active: this.store.getBoolean(KEY_ACTIVE) ?? false,
      duration: this.store.getNumber(KEY_DURATION) ?? 0,
      eventType: this.store.getString(KEY_EVENT_TYPE) ?? '',
      eventCode: this.store.getNumber(KEY_EVENT_CODE) ?? 0,
      eventMessage: this.store.getString(KEY_EVENT_MESSAGE) ?? '',
      seq: this.store.getNumber(KEY_EVENT_SEQ) ?? 0,
      logCount: (this.store.getStringArray(KEY_LOGS) ?? []).length
    };
  }

  private record(stage: PublishStage, type: string, code: number, message: string, seq: number): void {
    this.records.push({
      stage: stage,
      type: type,
      code: code,
      message: message,
      seq: seq,
      timestamp: Date.now()
    });
  }
}

/**
 * Verifier of the published event sequence.
 */
class SequenceVerifier {
  private sequences: number[] = [];

  public accept(seq: number): void {
    this.sequences.push(seq);
  }

  public getSequences(): number[] {
    return this.sequences.slice();
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.sequences.length; i++) {
      if (this.sequences[i] <= this.sequences[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isContiguous(): boolean {
    for (let i = 1; i < this.sequences.length; i++) {
      if (this.sequences[i] !== this.sequences[i - 1] + 1) {
        return false;
      }
    }
    return true;
  }

  public startsAt(value: number): boolean {
    if (this.sequences.length === 0) {
      return false;
    }
    return this.sequences[0] === value;
  }

  public last(): number {
    if (this.sequences.length === 0) {
      return 0;
    }
    return this.sequences[this.sequences.length - 1];
  }

  public count(): number {
    return this.sequences.length;
  }
}

/**
 * Maps the numeric system error code to the documented reason text, the exam page performs
 * the same mapping when it formats the interruption dialog.
 */
class EventCodeMapper {
  public reasonOf(code: number): string {
    if (code === 0) {
      return 'ok';
    }
    if (code === 1) {
      return 'user cancelled the assessment';
    }
    if (code === 2) {
      return 'the assessment timed out';
    }
    if (code === 3) {
      return 'a system error occurred';
    }
    if (code === 4) {
      return 'an environment anomaly was detected';
    }
    return 'the assessment exited';
  }

  public typeOf(type: string): EventType {
    if (type === EVENT_BEGIN) {
      return EventType.BEGIN;
    }
    if (type === EVENT_INTERRUPTED) {
      return EventType.INTERRUPTED;
    }
    if (type === EVENT_END) {
      return EventType.END;
    }
    if (type === EVENT_API_ERROR) {
      return EventType.API_ERROR;
    }
    return EventType.UNKNOWN;
  }

  public isKnownType(type: string): boolean {
    return this.typeOf(type) !== EventType.UNKNOWN;
  }

  public allTypes(): string[] {
    const types: string[] = [EVENT_BEGIN, EVENT_INTERRUPTED, EVENT_END, EVENT_API_ERROR];
    return types;
  }

  public formatsLine(type: string, code: number, message: string): string {
    return `${type} code=${code} message=${message}`;
  }
}

export default function appStorageEventValidationTest() {
  describe('AppStorageEventValidation_Test', () => {
    let driver: Driver;
    let store: SimulatedAppStorage;
    let schema: StorageSchema;
    let log: EventJournal;
    let publisher: EventPublisher;
    let mapper: EventCodeMapper;

    beforeAll(async () => {
      driver = getDriver();
      store = new SimulatedAppStorage();
      schema = new StorageSchema();
      log = new EventJournal();
      publisher = new EventPublisher(store, log);
      mapper = new EventCodeMapper();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the AppStorage key literals the controller publishes.
     * Expectation: the values match AssessmentConstants exactly.
     */
    it('Assessment_StorageKeyLiterals_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKeyLiterals_001, begin');
      expect(KEY_ACTIVE).assertEqual('assessmentActive');
      expect(KEY_DURATION).assertEqual('assessmentDuration');
      expect(KEY_LOGS).assertEqual('assessmentLogs');
      expect(KEY_EVENT_TYPE).assertEqual('assessmentEventType');
      expect(KEY_EVENT_CODE).assertEqual('assessmentEventCode');
      expect(KEY_EVENT_MESSAGE).assertEqual('assessmentEventMessage');
      expect(KEY_EVENT_SEQ).assertEqual('assessmentEventSeq');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKeyLiterals_001, end');
    });

    /**
     * Scenario: the schema declares exactly the seven keys of the sample.
     * Expectation: the key set is unique, complete and carries the shared prefix.
     */
    it('Assessment_StorageSchemaCoverage_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaCoverage_002, begin');
      expect(schema.count()).assertEqual(7);
      expect(schema.keys().length).assertEqual(7);
      expect(schema.hasUniqueKeys()).assertTrue();
      expect(schema.everyKeyPrefixed('assessment')).assertTrue();
      expect(schema.everyDescriptionPresent()).assertTrue();
      expect(schema.find(KEY_ACTIVE) !== undefined).assertTrue();
      expect(schema.find('assessmentMissing') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaCoverage_002, end');
    });

    /**
     * Scenario: the declared value kinds of the schema.
     * Expectation: two boolean or number flags, three numbers and two strings plus one list.
     */
    it('Assessment_StorageSchemaKinds_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaKinds_003, begin');
      expect(schema.countOfKind(ValueKind.BOOLEAN)).assertEqual(1);
      expect(schema.countOfKind(ValueKind.NUMBER)).assertEqual(3);
      expect(schema.countOfKind(ValueKind.STRING)).assertEqual(2);
      expect(schema.countOfKind(ValueKind.STRING_ARRAY)).assertEqual(1);
      expect(schema.countOfKind(ValueKind.UNKNOWN)).assertEqual(0);
      expect(schema.expectedKind(KEY_ACTIVE)).assertEqual(ValueKind.BOOLEAN);
      expect(schema.expectedKind(KEY_DURATION)).assertEqual(ValueKind.NUMBER);
      expect(schema.expectedKind(KEY_LOGS)).assertEqual(ValueKind.STRING_ARRAY);
      expect(schema.expectedKind(KEY_EVENT_TYPE)).assertEqual(ValueKind.STRING);
      expect(schema.expectedKind('assessmentMissing')).assertEqual(ValueKind.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaKinds_003, end');
    });

    /**
     * Scenario: the keys of one kind.
     * Expectation: the number keys are the duration, the event code and the sequence.
     */
    it('Assessment_StorageSchemaKeysOfKind_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaKeysOfKind_004, begin');
      const numbers: string[] = schema.keysOfKind(ValueKind.NUMBER);
      expect(numbers.length).assertEqual(3);
      expect(numbers.indexOf(KEY_DURATION) >= 0).assertTrue();
      expect(numbers.indexOf(KEY_EVENT_CODE) >= 0).assertTrue();
      expect(numbers.indexOf(KEY_EVENT_SEQ) >= 0).assertTrue();
      const strings: string[] = schema.keysOfKind(ValueKind.STRING);
      expect(strings.indexOf(KEY_EVENT_TYPE) >= 0).assertTrue();
      expect(strings.indexOf(KEY_EVENT_MESSAGE) >= 0).assertTrue();
      expect(schema.keysOfKind(ValueKind.STRING_ARRAY)[0]).assertEqual(KEY_LOGS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaKeysOfKind_004, end');
    });

    /**
     * Scenario: the event type constants of the callback pipeline.
     * Expectation: the four documented types are distinct and recognised.
     */
    it('Assessment_StorageEventTypeConstants_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventTypeConstants_005, begin');
      expect(EVENT_BEGIN).assertEqual('onBegin');
      expect(EVENT_INTERRUPTED).assertEqual('onInterrupted');
      expect(EVENT_END).assertEqual('onEnd');
      expect(EVENT_API_ERROR).assertEqual('onApiError');
      expect(mapper.isKnownType(EVENT_BEGIN)).assertTrue();
      expect(mapper.isKnownType(EVENT_INTERRUPTED)).assertTrue();
      expect(mapper.isKnownType(EVENT_END)).assertTrue();
      expect(mapper.isKnownType(EVENT_API_ERROR)).assertTrue();
      expect(mapper.isKnownType('onUnknown')).assertFalse();
      const types: Set<string> = new Set<string>(mapper.allTypes());
      expect(types.size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventTypeConstants_005, end');
    });

    /**
     * Scenario: the event type enumeration of the mapper.
     * Expectation: the type text maps onto the documented enumeration member.
     */
    it('Assessment_StorageEventTypeEnum_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventTypeEnum_006, begin');
      expect(EventType.BEGIN).assertEqual('onBegin');
      expect(EventType.INTERRUPTED).assertEqual('onInterrupted');
      expect(EventType.END).assertEqual('onEnd');
      expect(EventType.API_ERROR).assertEqual('onApiError');
      expect(mapper.typeOf(EVENT_BEGIN)).assertEqual(EventType.BEGIN);
      expect(mapper.typeOf(EVENT_INTERRUPTED)).assertEqual(EventType.INTERRUPTED);
      expect(mapper.typeOf(EVENT_END)).assertEqual(EventType.END);
      expect(mapper.typeOf(EVENT_API_ERROR)).assertEqual(EventType.API_ERROR);
      expect(mapper.typeOf('something')).assertEqual(EventType.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventTypeEnum_006, end');
    });

    /**
     * Scenario: the store starts empty.
     * Expectation: every getter answers undefined and no key is present.
     */
    it('Assessment_StorageEmptyStore_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptyStore_007, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      expect(local.keyCount()).assertEqual(0);
      expect(local.has(KEY_ACTIVE)).assertFalse();
      expect(local.getBoolean(KEY_ACTIVE) === undefined).assertTrue();
      expect(local.getNumber(KEY_EVENT_SEQ) === undefined).assertTrue();
      expect(local.getString(KEY_EVENT_TYPE) === undefined).assertTrue();
      expect(local.getStringArray(KEY_LOGS) === undefined).assertTrue();
      expect(local.kindOf(KEY_LOGS)).assertEqual(ValueKind.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptyStore_007, end');
    });

    /**
     * Scenario: typed set and get of every supported kind.
     * Expectation: the store returns the value with the kind it was written with.
     */
    it('Assessment_StorageTypedReadWrite_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageTypedReadWrite_008, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setBoolean(KEY_ACTIVE, true);
      local.setNumber(KEY_DURATION, 600000);
      local.setString(KEY_EVENT_TYPE, EVENT_BEGIN);
      local.setStringArray(KEY_LOGS, ['first', 'second']);
      expect(local.getBoolean(KEY_ACTIVE)).assertTrue();
      expect(local.getNumber(KEY_DURATION)).assertEqual(600000);
      expect(local.getString(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(local.getStringArray(KEY_LOGS)?.length).assertEqual(2);
      expect(local.kindOf(KEY_ACTIVE)).assertEqual(ValueKind.BOOLEAN);
      expect(local.kindOf(KEY_DURATION)).assertEqual(ValueKind.NUMBER);
      expect(local.kindOf(KEY_EVENT_TYPE)).assertEqual(ValueKind.STRING);
      expect(local.kindOf(KEY_LOGS)).assertEqual(ValueKind.STRING_ARRAY);
      expect(local.keyCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageTypedReadWrite_008, end');
    });

    /**
     * Scenario: overwriting a value keeps a single entry.
     * Expectation: the key count does not grow and the newest value wins.
     */
    it('Assessment_StorageOverwrite_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageOverwrite_009, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setNumber(KEY_EVENT_SEQ, 1);
      local.setNumber(KEY_EVENT_SEQ, 2);
      local.setNumber(KEY_EVENT_SEQ, 3);
      expect(local.keyCount()).assertEqual(1);
      expect(local.getNumber(KEY_EVENT_SEQ)).assertEqual(3);
      expect(local.getWrites()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageOverwrite_009, end');
    });

    /**
     * Scenario: writing a key with a second kind.
     * Expectation: the key becomes visible in both kind buckets, the duplicate detector
     * reports it.
     */
    it('Assessment_StorageKindCollision_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKindCollision_010, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setString(KEY_EVENT_TYPE, EVENT_BEGIN);
      local.setNumber(KEY_EVENT_TYPE, 42);
      expect(local.keyCount()).assertEqual(2);
      expect(local.duplicatedAcrossKinds().length).assertEqual(1);
      expect(local.duplicatedAcrossKinds()[0]).assertEqual(KEY_EVENT_TYPE);
      const allKeys: string[] = local.allKeys();
      expect(allKeys.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKindCollision_010, end');
    });

    /**
     * Scenario: the stored list is copied at write time.
     * Expectation: mutating the caller array does not change the stored value.
     */
    it('Assessment_StorageArrayCopyOnWrite_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageArrayCopyOnWrite_011, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      const source: string[] = ['alpha', 'beta'];
      local.setStringArray(KEY_LOGS, source);
      source.push('gamma');
      const stored: string[] | undefined = local.getStringArray(KEY_LOGS);
      expect(stored?.length).assertEqual(2);
      expect(stored?.[0]).assertEqual('alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageArrayCopyOnWrite_011, end');
    });

    /**
     * Scenario: the stored list is copied at read time.
     * Expectation: mutating the returned array does not change the stored value.
     */
    it('Assessment_StorageArrayCopyOnRead_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageArrayCopyOnRead_012, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setStringArray(KEY_LOGS, ['one']);
      const first: string[] | undefined = local.getStringArray(KEY_LOGS);
      if (first !== undefined) {
        first.push('two');
      }
      const second: string[] | undefined = local.getStringArray(KEY_LOGS);
      expect(second?.length).assertEqual(1);
      expect(second?.[0]).assertEqual('one');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageArrayCopyOnRead_012, end');
    });

    /**
     * Scenario: removing a key and clearing the store.
     * Expectation: remove reports whether the key existed, clear drops everything.
     */
    it('Assessment_StorageRemoveAndClear_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageRemoveAndClear_013, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setBoolean(KEY_ACTIVE, true);
      local.setNumber(KEY_EVENT_SEQ, 7);
      expect(local.remove(KEY_ACTIVE)).assertTrue();
      expect(local.remove(KEY_ACTIVE)).assertFalse();
      expect(local.has(KEY_ACTIVE)).assertFalse();
      expect(local.keyCount()).assertEqual(1);
      local.clear();
      expect(local.keyCount()).assertEqual(0);
      expect(local.getWrites()).assertEqual(0);
      expect(local.allKeys().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageRemoveAndClear_013, end');
    });

    /**
     * Scenario: the read and write counters of the store.
     * Expectation: every getter increments the read counter once.
     */
    it('Assessment_StorageCounters_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageCounters_014, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setBoolean(KEY_ACTIVE, false);
      local.setNumber(KEY_EVENT_SEQ, 0);
      expect(local.getWrites()).assertEqual(2);
      expect(local.getReads()).assertEqual(0);
      local.getBoolean(KEY_ACTIVE);
      local.getNumber(KEY_EVENT_SEQ);
      local.getString(KEY_EVENT_TYPE);
      expect(local.getReads()).assertEqual(3);
      expect(local.describe().includes('writes=2')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageCounters_014, end');
    });

    /**
     * Scenario: the first publish writes every event key once.
     * Expectation: the sequence becomes one and the log carries one entry.
     */
    it('Assessment_StorageFirstPublish_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageFirstPublish_015, begin');
      store.clear();
      log.clear();
      publisher.reset();
      const seq: number = publisher.publish(EVENT_BEGIN, 0, 'assessment began');
      expect(seq).assertEqual(1);
      expect(store.getNumber(KEY_EVENT_SEQ)).assertEqual(1);
      expect(store.getString(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(0);
      expect(store.getString(KEY_EVENT_MESSAGE)).assertEqual('assessment began');
      expect(store.getStringArray(KEY_LOGS)?.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageFirstPublish_015, end');
    });

    /**
     * Scenario: the publish pipeline stage order.
     * Expectation: log, type, code, message, sequence, complete in that exact order.
     */
    it('Assessment_StoragePublishStageOrder_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StoragePublishStageOrder_016, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_END, 0, '');
      const stages: PublishStage[] = publisher.getStageOrder();
      expect(stages.length).assertEqual(6);
      expect(stages[0]).assertEqual(PublishStage.APPEND_LOG);
      expect(stages[1]).assertEqual(PublishStage.SET_TYPE);
      expect(stages[2]).assertEqual(PublishStage.SET_CODE);
      expect(stages[3]).assertEqual(PublishStage.SET_MESSAGE);
      expect(stages[4]).assertEqual(PublishStage.INCREMENT_SEQ);
      expect(stages[5]).assertEqual(PublishStage.COMPLETE);
      expect(publisher.countOf(PublishStage.COMPLETE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StoragePublishStageOrder_016, end');
    });

    /**
     * Scenario: the sequence counter is monotonic across publishes.
     * Expectation: five publishes produce the sequence values one to five.
     */
    it('Assessment_StorageSequenceMonotonic_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceMonotonic_017, begin');
      store.clear();
      log.clear();
      publisher.reset();
      const verifier: SequenceVerifier = new SequenceVerifier();
      for (let i = 0; i < 5; i++) {
        verifier.accept(publisher.publish(EVENT_BEGIN, i, `message ${i}`));
      }
      expect(verifier.count()).assertEqual(5);
      expect(verifier.isMonotonic()).assertTrue();
      expect(verifier.isContiguous()).assertTrue();
      expect(verifier.startsAt(1)).assertTrue();
      expect(verifier.last()).assertEqual(5);
      expect(store.getNumber(KEY_EVENT_SEQ)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceMonotonic_017, end');
    });

    /**
     * Scenario: a published event replaces the previous event fields.
     * Expectation: only the newest type, code and message remain visible.
     */
    it('Assessment_StorageEventReplacement_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventReplacement_018, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_BEGIN, 0, 'first');
      publisher.publish(EVENT_INTERRUPTED, 2, 'timed out');
      publisher.publish(EVENT_END, 0, 'finished');
      const snapshot: PublishedSnapshot = publisher.snapshot();
      expect(snapshot.eventType).assertEqual(EVENT_END);
      expect(snapshot.eventCode).assertEqual(0);
      expect(snapshot.eventMessage).assertEqual('finished');
      expect(snapshot.seq).assertEqual(3);
      expect(snapshot.logCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEventReplacement_018, end');
    });

    /**
     * Scenario: the log keeps the newest entry first.
     * Expectation: the head of the log carries the newest event.
     */
    it('Assessment_StorageLogNewestFirst_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogNewestFirst_019, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_BEGIN, 0, 'first');
      publisher.publish(EVENT_INTERRUPTED, 3, 'second');
      const entries: string[] = log.entriesList();
      expect(entries.length).assertEqual(2);
      expect(entries[0].startsWith(EVENT_INTERRUPTED)).assertTrue();
      expect(entries[1].startsWith(EVENT_BEGIN)).assertTrue();
      expect(log.newest().includes('second')).assertTrue();
      expect(log.oldest().includes('first')).assertTrue();
      expect(log.isDescendingBySeq()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogNewestFirst_019, end');
    });

    /**
     * Scenario: the log format of the controller.
     * Expectation: the entry carries the type, the code and the message.
     */
    it('Assessment_StorageLogFormat_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogFormat_020, begin');
      const line: string = mapper.formatsLine(EVENT_INTERRUPTED, 2, 'timeout reached');
      expect(line).assertEqual('onInterrupted code=2 message=timeout reached');
      expect(line.includes('onInterrupted')).assertTrue();
      expect(line.includes('code=2')).assertTrue();
      expect(line.includes('timeout reached')).assertTrue();
      const empty: string = mapper.formatsLine(EVENT_END, 0, '');
      expect(empty).assertEqual('onEnd code=0 message=');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogFormat_020, end');
    });

    /**
     * Scenario: the stored log mirrors the internal log after every publish.
     * Expectation: the stored copy is always the current list.
     */
    it('Assessment_StorageLogMirror_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogMirror_023, begin');
      store.clear();
      log.clear();
      publisher.reset();
      for (let i = 0; i < 3; i++) {
        publisher.publish(EVENT_BEGIN, i, `mirror ${i}`);
        const stored: string[] = store.getStringArray(KEY_LOGS) ?? [];
        expect(stored.length).assertEqual(log.size());
        expect(stored[0]).assertEqual(log.entryAt(0));
      }
      expect(store.getStringArray(KEY_LOGS)?.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogMirror_023, end');
    });

    /**
     * Scenario: clearing the log resets the counters.
     * Expectation: a cleared log holds no entries and reports zero appends and drops.
     */
    it('Assessment_StorageLogClear_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogClear_024, begin');
      const localLog: EventJournal = new EventJournal();
      for (let i = 0; i < 5; i++) {
        localLog.append(`entry ${i}`);
      }
      expect(localLog.size()).assertEqual(5);
      localLog.clear();
      expect(localLog.size()).assertEqual(0);
      expect(localLog.getAppends()).assertEqual(0);
      expect(localLog.getDrops()).assertEqual(0);
      expect(localLog.newest()).assertEqual('');
      expect(localLog.oldest()).assertEqual('');
      expect(localLog.contains('entry 0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogClear_024, end');
    });

    /**
     * Scenario: the log getter returns an independent copy.
     * Expectation: mutating the returned list does not change the log.
     */
    it('Assessment_StorageLogDefensiveCopy_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogDefensiveCopy_025, begin');
      const localLog: EventJournal = new EventJournal();
      localLog.append('only entry');
      const copy: string[] = localLog.entriesList();
      copy.push('injected');
      expect(localLog.size()).assertEqual(1);
      expect(localLog.contains('injected')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogDefensiveCopy_025, end');
    });

    /**
     * Scenario: an empty log answers the neutral strings.
     * Expectation: newest, oldest and entryAt answer an empty string.
     */
    it('Assessment_StorageLogEmptyAnswers_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogEmptyAnswers_026, begin');
      const localLog: EventJournal = new EventJournal();
      expect(localLog.size()).assertEqual(0);
      expect(localLog.newest()).assertEqual('');
      expect(localLog.oldest()).assertEqual('');
      expect(localLog.entryAt(0)).assertEqual('');
      expect(localLog.entryAt(-1)).assertEqual('');
      expect(localLog.entryAt(100)).assertEqual('');
      expect(localLog.isDescendingBySeq()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLogEmptyAnswers_026, end');
    });

    /**
     * Scenario: publishing the active flag and the duration.
     * Expectation: the two state keys are independent of the event keys.
     */
    it('Assessment_StorageActiveAndDuration_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageActiveAndDuration_027, begin');
      store.clear();
      publisher.setActive(true);
      publisher.setDuration(600000);
      expect(store.getBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.getNumber(KEY_DURATION)).assertEqual(600000);
      expect(store.kindOf(KEY_ACTIVE)).assertEqual(ValueKind.BOOLEAN);
      expect(store.kindOf(KEY_DURATION)).assertEqual(ValueKind.NUMBER);
      expect(store.has(KEY_EVENT_SEQ)).assertFalse();
      publisher.setActive(false);
      expect(store.getBoolean(KEY_ACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageActiveAndDuration_027, end');
    });

    /**
     * Scenario: the schema check over a fully published store.
     * Expectation: after one of every key has been written the store matches the schema.
     */
    it('Assessment_StorageSchemaMatch_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaMatch_028, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.setActive(false);
      publisher.setDuration(1800000);
      publisher.publish(EVENT_BEGIN, 0, 'ok');
      expect(schema.matches(store)).assertTrue();
      expect(store.keyCount()).assertEqual(7);
      expect(store.duplicatedAcrossKinds().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaMatch_028, end');
    });

    /**
     * Scenario: the schema check rejects an incomplete store.
     * Expectation: a missing event key fails the match.
     */
    it('Assessment_StorageSchemaMismatch_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaMismatch_029, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setBoolean(KEY_ACTIVE, false);
      local.setNumber(KEY_DURATION, 0);
      local.setStringArray(KEY_LOGS, []);
      local.setString(KEY_EVENT_TYPE, EVENT_BEGIN);
      local.setNumber(KEY_EVENT_CODE, 0);
      local.setString(KEY_EVENT_MESSAGE, '');
      expect(schema.matches(local)).assertFalse();
      local.setNumber(KEY_EVENT_SEQ, 1);
      expect(schema.matches(local)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaMismatch_029, end');
    });

    /**
     * Scenario: the schema check rejects a wrong value kind.
     * Expectation: a string written to the sequence key fails the match.
     */
    it('Assessment_StorageSchemaWrongKind_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaWrongKind_030, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setBoolean(KEY_ACTIVE, false);
      local.setNumber(KEY_DURATION, 0);
      local.setStringArray(KEY_LOGS, []);
      local.setString(KEY_EVENT_TYPE, EVENT_BEGIN);
      local.setNumber(KEY_EVENT_CODE, 0);
      local.setString(KEY_EVENT_MESSAGE, '');
      local.setString(KEY_EVENT_SEQ, '1');
      expect(schema.matches(local)).assertFalse();
      expect(local.kindOf(KEY_EVENT_SEQ)).assertEqual(ValueKind.STRING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSchemaWrongKind_030, end');
    });

    /**
     * Scenario: the system code to reason mapping.
     * Expectation: every documented error code answers its own reason text.
     */
    it('Assessment_StorageReasonMapping_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageReasonMapping_031, begin');
      expect(mapper.reasonOf(0)).assertEqual('ok');
      expect(mapper.reasonOf(1)).assertEqual('user cancelled the assessment');
      expect(mapper.reasonOf(2)).assertEqual('the assessment timed out');
      expect(mapper.reasonOf(3)).assertEqual('a system error occurred');
      expect(mapper.reasonOf(4)).assertEqual('an environment anomaly was detected');
      expect(mapper.reasonOf(99)).assertEqual('the assessment exited');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageReasonMapping_031, end');
    });

    /**
     * Scenario: the reason texts are unique across the documented codes.
     * Expectation: no two codes share a reason text.
     */
    it('Assessment_StorageReasonUniqueness_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageReasonUniqueness_032, begin');
      const reasons: string[] = [];
      for (let code = 1; code <= 5; code++) {
        reasons.push(mapper.reasonOf(code));
      }
      const unique: Set<string> = new Set<string>(reasons);
      expect(unique.size).assertEqual(reasons.length);
      expect(reasons.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageReasonUniqueness_032, end');
    });

    /**
     * Scenario: the event sequence published for a failed begin.
     * Expectation: the active flag flips to false and the event carries the error code.
     */
    it('Assessment_StorageFailedBeginFlow_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageFailedBeginFlow_033, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.setDuration(600000);
      publisher.setActive(false);
      const seq: number = publisher.publish(EVENT_BEGIN, 1, 'the user cancelled');
      expect(seq).assertEqual(1);
      expect(store.getBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(1);
      expect(store.getString(KEY_EVENT_MESSAGE)).assertEqual('the user cancelled');
      expect(log.newest().includes('code=1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageFailedBeginFlow_033, end');
    });

    /**
     * Scenario: the event sequence published for a successful begin.
     * Expectation: the active flag flips to true and the code is zero.
     */
    it('Assessment_StorageSuccessfulBeginFlow_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSuccessfulBeginFlow_034, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.setActive(true);
      const seq: number = publisher.publish(EVENT_BEGIN, 0, 'started');
      expect(seq).assertEqual(1);
      expect(store.getBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(0);
      expect(store.getString(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSuccessfulBeginFlow_034, end');
    });

    /**
     * Scenario: the API error flow keeps the active state untouched.
     * Expectation: an API error publishes the code but never flips the active flag.
     */
    it('Assessment_StorageApiErrorFlow_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageApiErrorFlow_037, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.setActive(true);
      publisher.publish(EVENT_API_ERROR, 1001, 'begin threw');
      expect(store.getBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.getString(KEY_EVENT_TYPE)).assertEqual(EVENT_API_ERROR);
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(1001);
      expect(store.getString(KEY_EVENT_MESSAGE)).assertEqual('begin threw');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageApiErrorFlow_037, end');
    });

    /**
     * Scenario: a full lifecycle of published events.
     * Expectation: begin, interrupt, end produce a contiguous three step sequence.
     */
    it('Assessment_StorageLifecycleSequence_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLifecycleSequence_038, begin');
      store.clear();
      log.clear();
      publisher.reset();
      const verifier: SequenceVerifier = new SequenceVerifier();
      publisher.setActive(true);
      verifier.accept(publisher.publish(EVENT_BEGIN, 0, 'began'));
      publisher.setActive(false);
      verifier.accept(publisher.publish(EVENT_INTERRUPTED, 2, 'timed out'));
      verifier.accept(publisher.publish(EVENT_END, 0, ''));
      expect(verifier.count()).assertEqual(3);
      expect(verifier.isContiguous()).assertTrue();
      expect(verifier.last()).assertEqual(3);
      expect(log.size()).assertEqual(3);
      expect(log.isDescendingBySeq()).assertTrue();
      expect(log.entryAt(0).includes('onEnd')).assertTrue();
      expect(log.entryAt(2).includes('onBegin')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLifecycleSequence_038, end');
    });

    /**
     * Scenario: the sequence verifier detects a gap.
     * Expectation: a skipped value is reported as non contiguous.
     */
    it('Assessment_StorageSequenceGapDetected_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceGapDetected_039, begin');
      const verifier: SequenceVerifier = new SequenceVerifier();
      verifier.accept(1);
      verifier.accept(2);
      verifier.accept(4);
      expect(verifier.isMonotonic()).assertTrue();
      expect(verifier.isContiguous()).assertFalse();
      expect(verifier.last()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceGapDetected_039, end');
    });

    /**
     * Scenario: the sequence verifier detects a regression.
     * Expectation: a decreasing value is reported as non monotonic.
     */
    it('Assessment_StorageSequenceRegressionDetected_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceRegressionDetected_040, begin');
      const verifier: SequenceVerifier = new SequenceVerifier();
      verifier.accept(3);
      verifier.accept(2);
      expect(verifier.isMonotonic()).assertFalse();
      expect(verifier.isContiguous()).assertFalse();
      expect(verifier.startsAt(3)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceRegressionDetected_040, end');
    });

    /**
     * Scenario: the sequence starts from one on a fresh store.
     * Expectation: the first publish answers one and the second answers two.
     */
    it('Assessment_StorageSequenceStart_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceStart_041, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      const localLog: EventJournal = new EventJournal();
      const localPublisher: EventPublisher = new EventPublisher(local, localLog);
      expect(local.getNumber(KEY_EVENT_SEQ) === undefined).assertTrue();
      expect(localPublisher.publish(EVENT_BEGIN, 0, '')).assertEqual(1);
      expect(localPublisher.publish(EVENT_END, 0, '')).assertEqual(2);
      expect(local.getNumber(KEY_EVENT_SEQ)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSequenceStart_041, end');
    });

    /**
     * Scenario: the publish records keep the stage timestamps chronological.
     * Expectation: the record list is append only and ordered.
     */
    it('Assessment_StorageRecordChronology_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageRecordChronology_042, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_BEGIN, 0, 'a');
      publisher.publish(EVENT_END, 0, 'b');
      const records: PublishRecord[] = publisher.getRecords();
      expect(records.length).assertEqual(12);
      for (let i = 1; i < records.length; i++) {
        expect(records[i].timestamp >= records[i - 1].timestamp).assertTrue();
      }
      expect(records[0].type).assertEqual(EVENT_BEGIN);
      expect(records[11].type).assertEqual(EVENT_END);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageRecordChronology_042, end');
    });

    /**
     * Scenario: resetting the publisher drops its records only.
     * Expectation: the store keeps its values after a publish reset.
     */
    it('Assessment_StoragePublisherReset_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StoragePublisherReset_043, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_BEGIN, 0, 'kept');
      expect(publisher.getRecords().length).assertEqual(6);
      publisher.reset();
      expect(publisher.getRecords().length).assertEqual(0);
      expect(store.getString(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(store.getNumber(KEY_EVENT_SEQ)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StoragePublisherReset_043, end');
    });

    /**
     * Scenario: a snapshot of an empty store.
     * Expectation: every field answers its neutral default.
     */
    it('Assessment_StorageEmptySnapshot_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptySnapshot_044, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      const localPublisher: EventPublisher = new EventPublisher(local, new EventJournal());
      const snapshot: PublishedSnapshot = localPublisher.snapshot();
      expect(snapshot.active).assertFalse();
      expect(snapshot.duration).assertEqual(0);
      expect(snapshot.eventType).assertEqual('');
      expect(snapshot.eventCode).assertEqual(0);
      expect(snapshot.eventMessage).assertEqual('');
      expect(snapshot.seq).assertEqual(0);
      expect(snapshot.logCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptySnapshot_044, end');
    });

    /**
     * Scenario: the publish pipeline handles a large message.
     * Expectation: a two thousand character message is stored verbatim.
     */
    it('Assessment_StorageLongMessage_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLongMessage_045, begin');
      store.clear();
      log.clear();
      publisher.reset();
      let long: string = '';
      while (long.length < 2000) {
        long += 'x';
      }
      publisher.publish(EVENT_API_ERROR, 500, long);
      expect(store.getString(KEY_EVENT_MESSAGE)?.length).assertEqual(2000);
      expect(log.newest().includes(long)).assertTrue();
      expect(log.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageLongMessage_045, end');
    });

    /**
     * Scenario: the publish pipeline handles a negative and a large code.
     * Expectation: the numeric code is stored without any coercion.
     */
    it('Assessment_StorageCodeBoundaries_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageCodeBoundaries_046, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.publish(EVENT_API_ERROR, -1, 'negative');
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(-1);
      publisher.publish(EVENT_API_ERROR, 2147483647, 'large');
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(2147483647);
      publisher.publish(EVENT_END, 0, 'zero');
      expect(store.getNumber(KEY_EVENT_CODE)).assertEqual(0);
      expect(log.size()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageCodeBoundaries_046, end');
    });

    /**
     * Scenario: two publishers share one store.
     * Expectation: the sequence continues across the publishers instead of restarting.
     */
    it('Assessment_StorageSharedSequence_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSharedSequence_048, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      const sharedLog: EventJournal = new EventJournal();
      const first: EventPublisher = new EventPublisher(local, sharedLog);
      const second: EventPublisher = new EventPublisher(local, sharedLog);
      expect(first.publish(EVENT_BEGIN, 0, 'one')).assertEqual(1);
      expect(second.publish(EVENT_END, 0, 'two')).assertEqual(2);
      expect(local.getNumber(KEY_EVENT_SEQ)).assertEqual(2);
      expect(sharedLog.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSharedSequence_048, end');
    });

    /**
     * Scenario: the value kinds of a full snapshot.
     * Expectation: the snapshot reads one value of each declared kind.
     */
    it('Assessment_StorageSnapshotKinds_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSnapshotKinds_049, begin');
      store.clear();
      log.clear();
      publisher.reset();
      publisher.setActive(true);
      publisher.setDuration(1800000);
      publisher.publish(EVENT_BEGIN, 0, 'kinds');
      const snapshot: PublishedSnapshot = publisher.snapshot();
      expect(snapshot.active).assertTrue();
      expect(snapshot.duration).assertEqual(1800000);
      expect(snapshot.eventType).assertEqual(EVENT_BEGIN);
      expect(snapshot.seq).assertEqual(1);
      expect(snapshot.logCount).assertEqual(1);
      expect(typeof snapshot.eventType).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageSnapshotKinds_049, end');
    });

    /**
     * Scenario: the store handles empty strings and empty lists.
     * Expectation: an empty list is a valid stored value and stays distinct from a missing key.
     */
    it('Assessment_StorageEmptyValues_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptyValues_050, begin');
      const local: SimulatedAppStorage = new SimulatedAppStorage();
      local.setString(KEY_EVENT_MESSAGE, '');
      local.setStringArray(KEY_LOGS, []);
      expect(local.has(KEY_EVENT_MESSAGE)).assertTrue();
      expect(local.getString(KEY_EVENT_MESSAGE)).assertEqual('');
      expect(local.has(KEY_LOGS)).assertTrue();
      expect(local.getStringArray(KEY_LOGS)?.length).assertEqual(0);
      expect(local.has(KEY_EVENT_TYPE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageEmptyValues_050, end');
    });
  });
}
