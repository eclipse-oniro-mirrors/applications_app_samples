'use static';
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

/**
 * ConfigurationLifecycle freezes the configuration literals of the sample:
 *
 *   RdbConstant.ets:31      TABLE_NAME is 'contact'
 *   RdbConstant.ets:33-34   the CREATE TABLE text with seven columns
 *   RdbConstant.ets:36      STORE_CONFIG name 'contact.db'
 *   RdbConstant.ets:38      ABILITY is 'EntryAbility'
 *   CommonConstant.ets:51-53  MAX_LENGTH_MODERATE / LONG / VERY_LONG
 *   CommonConstant.ets:60-62  search text and text weight
 *   AddressBookEdit.ets:176-279 maxLength 12 / 12 / 25 / 100 on the inputs
 *
 * ConfigSnapshot records the parsed schema so two parses can be compared without
 * depending on string formatting.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import { CommonConstants } from '../../../../main/ets/pages/constant/CommonConstant';
import {
  StoreDouble,
  SchemaInfo,
  ContactValidation,
  ContactMapper,
  Bucket,
  TABLE_CONTACT,
  STORE_NAME,
  STORE_ABILITY,
  SQL_CREATE_CONTACT,
  BUCKET_KEYS,
  CATEGORIES,
  CATEGORY_A,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_ADDRESS_LENGTH,
  createSeedContacts,
  contactOf,
  joined,
  uniqueStrings,
  sameStringArray,
  countOf,
  textFingerprint,
  isDigitsOnly,
  hasEmailShape,
  resetContactManager
} from '../Shared/SharedDriver';

/** Immutable view of the configuration that must not drift between parses. */
class ConfigSnapshot {
  public table: string;
  public store: string;
  public ability: string;
  public columns: number;
  public notNull: number;
  public primaryKey: string;
  public autoincrement: boolean;
  public describeText: string;

  constructor(schema: SchemaInfo) {
    this.table = schema.table;
    this.store = STORE_NAME;
    this.ability = STORE_ABILITY;
    this.columns = schema.columnCount();
    this.notNull = schema.notNullColumns.length;
    this.primaryKey = schema.primaryKey;
    this.autoincrement = schema.autoincrement;
    this.describeText = schema.describe();
  }

  public sameAs(other: ConfigSnapshot): boolean {
    return this.table === other.table && this.store === other.store && this.ability === other.ability &&
      this.columns === other.columns && this.notNull === other.notNull &&
      this.primaryKey === other.primaryKey && this.autoincrement === other.autoincrement;
  }

  public describe(): string {
    return this.table + '|' + this.store + '|' + this.ability + '|' + String(this.columns) + '|' +
      String(this.notNull) + '|' + this.primaryKey + '|' + String(this.autoincrement);
  }

  public fingerprint(): number {
    return textFingerprint(this.describe());
  }
}

/** Builds a string of the requested length from one repeated character. */
function repeated(unitText: string, length: number): string {
  let text = '';
  for (let index = 0; index < length; index++) {
    text = text + unitText;
  }
  return text;
}

/** A contact that passes every edit-form rule. */
function validContact(): Contact {
  return contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', 'avatar-a', 'A');
}

export default function configurationLifecycleTest(): void {
  describe('ConfigurationLifecycle', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('ConfigurationLifecycle', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('ConfigurationLifecycle', 'end');
    });

    /**
     * @tc.name   tableNameConstantIsContact
     * @tc.desc   TABLE_NAME is the literal 'contact' used by every SQL statement in the sample.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('tableNameConstantIsContact', 0, () => {
      logStep('table', TABLE_CONTACT);
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(TABLE_CONTACT.length).assertEqual(7);
      expect(SQL_CREATE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(TABLE_CONTACT.indexOf(' ')).assertEqual(-1);
      expect(TABLE_CONTACT === 'contact.db').assertFalse();
    });

    /**
     * @tc.name   storeNameConstantIsContactDb
     * @tc.desc   STORE_CONFIG.name is 'contact.db', the file the store opens on the device.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeNameConstantIsContactDb', 0, () => {
      logStep('store-name', STORE_NAME);
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(STORE_NAME.startsWith('contact')).assertTrue();
      expect(STORE_NAME.length).assertEqual(10);
      expect(STORE_NAME === TABLE_CONTACT).assertFalse();
    });

    /**
     * @tc.name   abilityConstantIsEntryAbility
     * @tc.desc   ABILITY names the ability that supplies the UIAbilityContext.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('abilityConstantIsEntryAbility', 0, () => {
      logStep('ability', STORE_ABILITY);
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(STORE_ABILITY.length).assertEqual(12);
      expect(STORE_ABILITY.endsWith('Ability')).assertTrue();
      expect(STORE_ABILITY.startsWith('Entry')).assertTrue();
      expect(STORE_ABILITY === STORE_NAME).assertFalse();
    });

    /**
     * @tc.name   schemaTableMatchesTableConstant
     * @tc.desc   The parsed schema table equals TABLE_NAME, so create and DML cannot diverge.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaTableMatchesTableConstant', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('schema-table', schema.table);
      expect(schema.table).assertEqual(TABLE_CONTACT);
      expect(schema.table).assertEqual('contact');
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS contact')).assertEqual(0);
      expect(new SchemaInfo(SQL_CREATE_CONTACT).table).assertEqual(schema.table);
      expect(schema.describe().startsWith('contact|')).assertTrue();
    });

    /**
     * @tc.name   schemaHasColumnCountSeven
     * @tc.desc   The schema declares id plus the six payload columns, seven in total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaHasColumnCountSeven', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('column-count', String(schema.columnCount()));
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.columns[6]).assertEqual('category');
      expect(schema.columns.length).assertEqual(BUCKET_KEYS.length + 1);
      expect(schema.hasColumn('phone')).assertTrue();
    });

    /**
     * @tc.name   schemaPrimaryKeyIsId
     * @tc.desc   The id column carries the PRIMARY KEY clause and is the only key.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaPrimaryKeyIsId', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('primary-key', schema.primaryKey);
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.primaryKey === 'name').assertFalse();
      expect(schema.isNotNull('id')).assertFalse();
      expect(schema.columns.indexOf('id')).assertEqual(0);
      expect(SQL_CREATE_CONTACT.indexOf('PRIMARY KEY') >= 0).assertTrue();
    });

    /**
     * @tc.name   schemaAutoincrementEnabled
     * @tc.desc   The primary key is declared AUTOINCREMENT so inserts need no explicit id.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaAutoincrementEnabled', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('autoincrement', String(schema.autoincrement));
      expect(schema.autoincrement).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('AUTOINCREMENT') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('INTEGER PRIMARY KEY AUTOINCREMENT') >= 0).assertTrue();
      expect(BUCKET_KEYS.indexOf('id')).assertEqual(-1);
      expect(schema.describe().endsWith('true')).assertTrue();
    });

    /**
     * @tc.name   schemaNotNullColumnsAreSix
     * @tc.desc   Only the six payload columns are NOT NULL; the id column is generated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaNotNullColumnsAreSix', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('not-null', joined(schema.notNullColumns, ','));
      expect(schema.notNullColumns.length).assertEqual(6);
      expect(sameStringArray(schema.notNullColumns, BUCKET_KEYS)).assertTrue();
      expect(schema.isNotNull('id')).assertFalse();
      expect(schema.isNotNull('name')).assertTrue();
      expect(schema.isNotNull('category')).assertTrue();
    });

    /**
     * @tc.name   schemaColumnOrderStable
     * @tc.desc   Two independent parses produce the same ordered column list and description.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnOrderStable', 0, () => {
      const first: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const second: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('column-order', joined(first.columns, ','));
      expect(sameStringArray(first.columns, second.columns)).assertTrue();
      expect(first.columns[1]).assertEqual('name');
      expect(first.columns[3]).assertEqual('email');
      expect(first.describe()).assertEqual(second.describe());
      expect(first.columnCount()).assertEqual(second.columnCount());
    });

    /**
     * @tc.name   schemaFingerprintStableAcrossParses
     * @tc.desc   Hashing the schema description twice yields one value, so drift becomes detectable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaFingerprintStableAcrossParses', 0, () => {
      const first: number = textFingerprint(new SchemaInfo(SQL_CREATE_CONTACT).describe());
      const second: number = textFingerprint(new SchemaInfo(SQL_CREATE_CONTACT).describe());
      logStep('schema-fingerprint', String(first));
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
      expect(textFingerprint(TABLE_CONTACT) === first).assertFalse();
      expect(textFingerprint('')).assertEqual(216613);
    });

    /**
     * @tc.name   bucketKeysMatchSchemaColumns
     * @tc.desc   Every bucket key corresponds to a schema data column after the generated id.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bucketKeysMatchSchemaColumns', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const dataColumns: string[] = schema.columns.slice(1);
      logStep('bucket-keys', joined(BUCKET_KEYS, ','));
      expect(sameStringArray(dataColumns, BUCKET_KEYS)).assertTrue();
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(schema.hasColumn(BUCKET_KEYS[0])).assertTrue();
      expect(schema.hasColumn(BUCKET_KEYS[5])).assertTrue();
      expect(BUCKET_KEYS[5]).assertEqual('category');
    });

    /**
     * @tc.name   configSnapshotCapturesConstants
     * @tc.desc   A ConfigSnapshot records the table, store, ability, column count and key.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configSnapshotCapturesConstants', 0, () => {
      const snapshot: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      logStep('config-snapshot', snapshot.describe());
      expect(snapshot.table).assertEqual('contact');
      expect(snapshot.store).assertEqual('contact.db');
      expect(snapshot.ability).assertEqual('EntryAbility');
      expect(snapshot.columns).assertEqual(7);
      expect(snapshot.notNull).assertEqual(6);
      expect(snapshot.primaryKey).assertEqual('id');
      expect(snapshot.autoincrement).assertTrue();
    });

    /**
     * @tc.name   configSnapshotsCompareEqual
     * @tc.desc   Two snapshots built from separate parses compare equal field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configSnapshotsCompareEqual', 0, () => {
      const left: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      const right: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      logStep('config-equal', String(left.sameAs(right)));
      expect(left.sameAs(right)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.describeText).assertEqual(right.describeText);
      expect(left.sameAs(left)).assertTrue();
    });

    /**
     * @tc.name   configFingerprintDeterministic
     * @tc.desc   The configuration fingerprint is reproducible and differs from the empty hash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configFingerprintDeterministic', 0, () => {
      const first: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      const second: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      logStep('config-fingerprint', String(first.fingerprint()));
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.fingerprint() === textFingerprint('')).assertFalse();
      expect(first.fingerprint()).assertEqual(textFingerprint(first.describe()));
      expect(first.fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name   maxNameLengthIsTwelve
     * @tc.desc   The name input length matches MAX_LENGTH_MODERATE, used twice on the edit form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('maxNameLengthIsTwelve', 0, () => {
      logStep('name-limit', String(MAX_NAME_LENGTH));
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(MAX_NAME_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_MODERATE);
      expect(MAX_PHONE_LENGTH).assertEqual(MAX_NAME_LENGTH);
      expect(repeated('名', 12).length).assertEqual(MAX_NAME_LENGTH);
      expect(repeated('名', 13).length > MAX_NAME_LENGTH).assertTrue();
    });

    /**
     * @tc.name   maxPhoneLengthIsTwelve
     * @tc.desc   The phone input shares the moderate limit and additionally requires digits only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('maxPhoneLengthIsTwelve', 0, () => {
      logStep('phone-limit', String(MAX_PHONE_LENGTH));
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(isDigitsOnly(repeated('1', 12))).assertTrue();
      expect(isDigitsOnly('1380013800a')).assertFalse();
      expect(repeated('1', 12).length).assertEqual(MAX_PHONE_LENGTH);
      expect(MAX_PHONE_LENGTH === MAX_EMAIL_LENGTH).assertFalse();
    });

    /**
     * @tc.name   maxEmailLengthIsTwentyFive
     * @tc.desc   The email input uses MAX_LENGTH_LONG, which is twenty five characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('maxEmailLengthIsTwentyFive', 0, () => {
      logStep('email-limit', String(MAX_EMAIL_LENGTH));
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(MAX_EMAIL_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_LONG);
      expect(repeated('a', 25).length).assertEqual(MAX_EMAIL_LENGTH);
      expect(repeated('a', 26).length > MAX_EMAIL_LENGTH).assertTrue();
      expect(hasEmailShape('lin@example.com')).assertTrue();
    });

    /**
     * @tc.name   maxAddressLengthIsOneHundred
     * @tc.desc   The address input uses MAX_LENGTH_VERY_LONG, which is one hundred characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('maxAddressLengthIsOneHundred', 0, () => {
      logStep('address-limit', String(MAX_ADDRESS_LENGTH));
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_ADDRESS_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_VERY_LONG);
      expect(repeated('址', 100).length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(repeated('址', 101).length > MAX_ADDRESS_LENGTH).assertTrue();
      expect(MAX_ADDRESS_LENGTH > MAX_EMAIL_LENGTH).assertTrue();
    });

    /**
     * @tc.name   lengthConstantsAreOrdered
     * @tc.desc   The three limits are strictly increasing and each equals its CommonConstants source.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lengthConstantsAreOrdered', 0, () => {
      const limits: number[] = [MAX_NAME_LENGTH, MAX_EMAIL_LENGTH, MAX_ADDRESS_LENGTH];
      logStep('limits', joined([String(limits[0]), String(limits[1]), String(limits[2])], '<'));
      expect(limits.length).assertEqual(3);
      expect(limits[0] < limits[1]).assertTrue();
      expect(limits[1] < limits[2]).assertTrue();
      expect(uniqueStrings([String(limits[0]), String(limits[1]), String(limits[2])]).length).assertEqual(3);
      expect(CommonConstants.MAX_LENGTH_MODERATE < CommonConstants.MAX_LENGTH_LONG).assertTrue();
    });

    /**
     * @tc.name   categoriesAreSixDistinctLetters
     * @tc.desc   The six category literals are single distinct letters from A to F in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoriesAreSixDistinctLetters', 0, () => {
      logStep('categories', joined(CATEGORIES, ','));
      expect(CATEGORIES.length).assertEqual(6);
      expect(uniqueStrings(CATEGORIES).length).assertEqual(6);
      expect(CATEGORY_A).assertEqual('A');
      expect(CATEGORIES[5]).assertEqual('F');
      expect(CATEGORIES[0].length).assertEqual(1);
      expect(CATEGORIES[5].length).assertEqual(1);
    });

    /**
     * @tc.name   createTableHasIfNotExistsGuard
     * @tc.desc   The schema is idempotent because it carries the IF NOT EXISTS guard.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createTableHasIfNotExistsGuard', 0, () => {
      logStep('guard', String(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS')));
      expect(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE')).assertEqual(0);
      expect(SQL_CREATE_CONTACT.indexOf(';')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.endsWith(')')).assertTrue();
      expect(SQL_CREATE_CONTACT.length > 100).assertTrue();
    });

    /**
     * @tc.name   configurationSchemaHasNoDuplicateColumns
     * @tc.desc   The parsed column list contains no repeated name, so a bucket maps one to one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configurationSchemaHasNoDuplicateColumns', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const distinct: string[] = uniqueStrings(schema.columns);
      logStep('distinct-columns', String(distinct.length));
      expect(schema.columns.length).assertEqual(7);
      expect(distinct.length).assertEqual(7);
      expect(countOf(schema.columns, 'name')).assertEqual(1);
      expect(countOf(schema.columns, 'category')).assertEqual(1);
      expect(schema.columns.indexOf('avatar')).assertEqual(5);
    });

    /**
     * @tc.name   configSurvivesReinit
     * @tc.desc   Re-initializing a reset store keeps the same table and one createTable call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configSurvivesReinit', 0, () => {
      store.init(true);
      const firstTable: number = store.createTableCalls;
      store.reset();
      store.init(true);
      logStep('reinit-table', String(firstTable) + '->' + String(store.createTableCalls));
      expect(firstTable).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(TABLE_CONTACT).assertEqual('contact');
    });

    /**
     * @tc.name   schemaConstantUnchangedAfterReset
     * @tc.desc   Inserting, resetting and re-parsing never changes the schema literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaConstantUnchangedAfterReset', 0, () => {
      const before: string = SQL_CREATE_CONTACT;
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.reset();
      store.batchInsert(true, createSeedContacts().slice(0, 1));
      const after: string = SQL_CREATE_CONTACT;
      logStep('schema-stable', String(before === after));
      expect(before === after).assertTrue();
      expect(new SchemaInfo(after).columnCount()).assertEqual(7);
      expect(store.rowCount()).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   validationAcceptsValidContact
     * @tc.desc   A contact inside every limit produces no validation error and can be submitted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationAcceptsValidContact', 0, () => {
      const contact: Contact = validContact();
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('valid-contact', String(errors.length));
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(contact, [])).assertTrue();
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(isDigitsOnly(contact.phone)).assertTrue();
      expect(contact.name.length <= MAX_NAME_LENGTH).assertTrue();
    });

    /**
     * @tc.name   validationRejectsThirteenCharName
     * @tc.desc   A thirteen character name exceeds the moderate limit and reports name-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationRejectsThirteenCharName', 0, () => {
      const contact: Contact = validContact();
      contact.name = repeated('名', 13);
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('long-name', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      expect(ContactValidation.canSubmit(contact, [])).assertFalse();
      expect(contact.name.length).assertEqual(MAX_NAME_LENGTH + 1);
      expect(contact.phone).assertEqual('13800138000');
    });

    /**
     * @tc.name   validationAcceptsTwelveCharName
     * @tc.desc   Exactly twelve characters is the inclusive boundary and passes the name rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationAcceptsTwelveCharName', 0, () => {
      const contact: Contact = validContact();
      contact.name = repeated('名', 12);
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('boundary-name', String(contact.name.length));
      expect(errors.length).assertEqual(0);
      expect(contact.name.length).assertEqual(MAX_NAME_LENGTH);
      expect(ContactValidation.canSubmit(contact, [])).assertTrue();
      expect(countOf(errors, 'name-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   validationRejectsHundredOneAddress
     * @tc.desc   A one hundred and one character address exceeds the very long limit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationRejectsHundredOneAddress', 0, () => {
      const contact: Contact = validContact();
      contact.address = repeated('址', 101);
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('long-address', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(contact.address.length).assertEqual(MAX_ADDRESS_LENGTH + 1);
      expect(ContactValidation.canSubmit(contact, [])).assertFalse();
      expect(errors.indexOf('name-too-long')).assertEqual(-1);
    });

    /**
     * @tc.name   validationAcceptsHundredAddress
     * @tc.desc   Exactly one hundred address characters is accepted, proving the boundary is inclusive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationAcceptsHundredAddress', 0, () => {
      const contact: Contact = validContact();
      contact.address = repeated('址', 100);
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('address-boundary', String(contact.address.length));
      expect(errors.length).assertEqual(0);
      expect(contact.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(ContactValidation.canSubmit(contact, [])).assertTrue();
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
      expect(countOf(errors, 'address-empty')).assertEqual(0);
    });

    /**
     * @tc.name   validationRejectsMalformedEmail
     * @tc.desc   An email without an @ or a dot reports email-malformed and blocks submission.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationRejectsMalformedEmail', 0, () => {
      const contact: Contact = validContact();
      contact.email = 'lin.example.com';
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('bad-email', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(hasEmailShape(contact.email)).assertFalse();
      expect(ContactValidation.canSubmit(contact, [])).assertFalse();
      expect(hasEmailShape('lin@example.com')).assertTrue();
    });

    /**
     * @tc.name   validationAcceptsTwentyFiveEmail
     * @tc.desc   A twenty five character email sits on the LONG boundary and is accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationAcceptsTwentyFiveEmail', 0, () => {
      const contact: Contact = validContact();
      contact.email = 'abcdefghijklm@example.com';
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('email-boundary', String(contact.email.length));
      expect(contact.email.length).assertEqual(MAX_EMAIL_LENGTH);
      expect(errors.length).assertEqual(0);
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(ContactValidation.canSubmit(contact, [])).assertTrue();
      expect(countOf(errors, 'email-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   validationRejectsTwentySixEmail
     * @tc.desc   One character over the LONG limit reports email-too-long in addition to the shape rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationRejectsTwentySixEmail', 0, () => {
      const contact: Contact = validContact();
      contact.email = 'abcdefghijklmn@example.com';
      const errors: string[] = ContactValidation.validate(contact, []);
      logStep('long-email', joined(errors, ','));
      expect(contact.email.length).assertEqual(MAX_EMAIL_LENGTH + 1);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(ContactValidation.canSubmit(contact, [])).assertFalse();
      expect(hasEmailShape(contact.email)).assertTrue();
    });

    /**
     * @tc.name   validationFlagsEmptyRequiredFields
     * @tc.desc   An empty contact reports each of the four required field errors in source order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationFlagsEmptyRequiredFields', 0, () => {
      const empty: Contact = new Contact();
      const errors: string[] = ContactValidation.validate(empty, []);
      logStep('empty-contact', joined(errors, ','));
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-empty');
      expect(errors[2]).assertEqual('email-empty');
      expect(errors[3]).assertEqual('address-empty');
      expect(ContactValidation.canSubmit(empty, [])).assertFalse();
    });

    /**
     * @tc.name   duplicateNameValidationUsesExistingRows
     * @tc.desc   A draft whose name already exists reports name-duplicate as the only error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNameValidationUsesExistingRows', 0, () => {
      const existing: Contact[] = createSeedContacts().slice(0, 3);
      const draft: Contact = validContact();
      draft.name = '贝拉';
      const errors: string[] = ContactValidation.validate(draft, existing);
      logStep('duplicate-error', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.isDuplicateName(existing, '贝拉')).assertTrue();
      expect(ContactValidation.isDuplicateName(existing, '林岸')).assertFalse();
      expect(ContactValidation.canSubmit(draft, existing)).assertFalse();
    });

    /**
     * @tc.name   bucketSizeMatchesSchemaNotNullCount
     * @tc.desc   A well formed bucket fills exactly the six NOT NULL data columns.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketSizeMatchesSchemaNotNullCount', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const bucket: Bucket = ContactMapper.toBucket(validContact());
      logStep('bucket-size', String(bucket.size()));
      expect(bucket.size()).assertEqual(6);
      expect(bucket.size()).assertEqual(schema.notNullColumns.length);
      expect(bucket.size()).assertEqual(schema.columnCount() - 1);
      expect(bucket.has('id')).assertFalse();
      expect(bucket.get('category')).assertEqual('A');
    });

    /**
     * @tc.name   searchConstantsMatchSource
     * @tc.desc   The search button literals in CommonConstants keep their production values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchConstantsMatchSource', 0, () => {
      logStep('search-constants', CommonConstants.SEARCH_TEXT);
      expect(CommonConstants.SEARCH_TEXT).assertEqual('搜索');
      expect(CommonConstants.SEARCH_TEXT.length).assertEqual(2);
      expect(CommonConstants.SEARCH_TEXT_SIZE).assertEqual(14);
      expect(CommonConstants.SEARCH_TEXT_WEIGHT).assertEqual(400);
      expect(CommonConstants.FULL_PERCENT).assertEqual('100%');
      expect(CommonConstants.HALF_PERCENT).assertEqual('50%');
    });

    /**
     * @tc.name   configSnapshotRebuiltAfterReset
     * @tc.desc   A snapshot taken after a reset is identical to one taken before it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configSnapshotRebuiltAfterReset', 0, () => {
      const before: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const after: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      logStep('snapshot-reset', String(before.sameAs(after)));
      expect(before.sameAs(after)).assertTrue();
      expect(before.fingerprint()).assertEqual(after.fingerprint());
      expect(after.describeText).assertEqual(before.describeText);
      expect(after.columns).assertEqual(7);
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   schemaColumnTypesAreText
     * @tc.desc   The six payload columns are declared TEXT NOT NULL and the id stays INTEGER.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnTypesAreText', 0, () => {
      const textParts: string[] = SQL_CREATE_CONTACT.split('TEXT NOT NULL');
      const sqlTypeParts: string[] = SQL_CREATE_CONTACT.split('INTEGER');
      logStep('text-columns', String(textParts.length - 1));
      expect(textParts.length - 1).assertEqual(6);
      expect(sqlTypeParts.length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.indexOf('TEXT NOT NULL') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('INTEGER PRIMARY KEY') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('BLOB')).assertEqual(-1);
    });

    /**
     * @tc.name   phoneBoundaryAcceptsTwelveDigits
     * @tc.desc   Twelve digits pass the phone rules while thirteen digits report phone-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneBoundaryAcceptsTwelveDigits', 0, () => {
      const accepted: Contact = validContact();
      accepted.phone = repeated('1', 12);
      const rejected: Contact = validContact();
      rejected.phone = repeated('1', 13);
      const acceptedErrors: string[] = ContactValidation.validate(accepted, []);
      const rejectedErrors: string[] = ContactValidation.validate(rejected, []);
      logStep('phone-boundary', String(accepted.phone.length) + '/' + String(rejected.phone.length));
      expect(acceptedErrors.length).assertEqual(0);
      expect(rejectedErrors.length).assertEqual(1);
      expect(rejectedErrors[0]).assertEqual('phone-too-long');
      expect(isDigitsOnly(rejected.phone)).assertTrue();
      expect(ContactValidation.canSubmit(rejected, [])).assertFalse();
    });

    /**
     * @tc.name   categoriesCoverSeedPayload
     * @tc.desc   The seeded payload exercises all six category letters in ascending order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoriesCoverSeedPayload', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const seen: string[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seen.indexOf(seed[index].category) < 0) {
          seen.push(seed[index].category);
        }
      }
      logStep('seed-categories', joined(seen, ','));
      expect(seen.length).assertEqual(6);
      expect(sameStringArray(seen, CATEGORIES)).assertTrue();
      expect(seed[0].category).assertEqual(CATEGORY_A);
      expect(seed[14].category).assertEqual('F');
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   tableAndStoreNamesAreDistinct
     * @tc.desc   The table name and the database file name are different identifiers with fixed lengths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tableAndStoreNamesAreDistinct', 0, () => {
      logStep('names', TABLE_CONTACT + '|' + STORE_NAME);
      expect(TABLE_CONTACT === STORE_NAME).assertFalse();
      expect(TABLE_CONTACT.length).assertEqual(7);
      expect(STORE_NAME.length).assertEqual(10);
      expect(STORE_NAME.indexOf(TABLE_CONTACT)).assertEqual(0);
      expect(STORE_ABILITY.indexOf('Ability')).assertEqual(5);
    });

    /**
     * @tc.name   schemaLiteralContainsAllBucketKeys
     * @tc.desc   Every bucket key appears in the CREATE TABLE literal, so a bucket insert cannot miss a column.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaLiteralContainsAllBucketKeys', 0, () => {
      let present = 0;
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        if (SQL_CREATE_CONTACT.indexOf(BUCKET_KEYS[index]) > 0) {
          present = present + 1;
        }
      }
      logStep('keys-present', String(present));
      expect(present).assertEqual(6);
      expect(present).assertEqual(BUCKET_KEYS.length);
      expect(new SchemaInfo(SQL_CREATE_CONTACT).hasColumn('mail')).assertFalse();
      expect(SQL_CREATE_CONTACT.indexOf('avatar') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('phone') >= 0).assertTrue();
    });

    /**
     * @tc.name   configSnapshotDetectsSchemaDrift
     * @tc.desc   A snapshot of a shortened statement differs from the production one, proving drift is caught.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConfigurationLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configSnapshotDetectsSchemaDrift', 0, () => {
      const actual: ConfigSnapshot = new ConfigSnapshot(new SchemaInfo(SQL_CREATE_CONTACT));
      const drifted: ConfigSnapshot = new ConfigSnapshot(
        new SchemaInfo('CREATE TABLE IF NOT EXISTS contact(id INTEGER PRIMARY KEY AUTOINCREMENT)'));
      logStep('drift', actual.describe() + ' vs ' + drifted.describe());
      expect(actual.sameAs(drifted)).assertFalse();
      expect(actual.columns).assertEqual(7);
      expect(drifted.columns).assertEqual(1);
      expect(actual.fingerprint() === drifted.fingerprint()).assertFalse();
      expect(drifted.notNull).assertEqual(0);
    });
  });
}
