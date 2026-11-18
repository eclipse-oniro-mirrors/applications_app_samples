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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import { DataValidator } from '../../../main/ets/utils/DataValidator';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataValidatorTest(): void {
  describe('DataValidatorTest', () => {
    beforeAll(() => {
      addLog('DataValidatorTest suite started');
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(() => {
      addLog('DataValidatorTest suite finished');
    })



    /*
     * @tc.number: SUB_DATA_VALIDATOR_0100
     * @tc.name: testDataValidator0001
     * @tc.desc: Verify isString returns true for valid string input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0001', 0, (done: Function) => {
      runCase('testDataValidator0001', async (): Promise<void> => {
        const result: boolean = DataValidator.isString('hello');
        addLog('testDataValidator0001: isString(hello)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isString(null)).assertFalse();
        expect(DataValidator.isString(42 as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_0200
     * @tc.name: testDataValidator0002
     * @tc.desc: Verify isString returns false for null input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0002', 0, (done: Function) => {
      runCase('testDataValidator0002', async (): Promise<void> => {
        const result: boolean = DataValidator.isString(null);
        addLog('testDataValidator0002: isString(null)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isString('valid')).assertTrue();
        const numVal: number = 123;
        expect(DataValidator.isString(numVal as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_0300
     * @tc.name: testDataValidator0003
     * @tc.desc: Verify isString returns false for number input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0003', 0, (done: Function) => {
      runCase('testDataValidator0003', async (): Promise<void> => {
        const numValue: number = 42;
        const result: boolean = DataValidator.isString(numValue as Object);
        addLog('testDataValidator0003: isString(42)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isString('valid')).assertTrue();
        expect(DataValidator.isString(null)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_0400
     * @tc.name: testDataValidator0004
     * @tc.desc: Verify isNumber returns true for valid number input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0004', 0, (done: Function) => {
      runCase('testDataValidator0004', async (): Promise<void> => {
        const result: boolean = DataValidator.isNumber(42);
        addLog('testDataValidator0004: isNumber(42)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isNumber(null)).assertFalse();
        expect(DataValidator.isNumber(NaN)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_0500
     * @tc.name: testDataValidator0005
     * @tc.desc: Verify isNumber returns false for NaN input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0005', 0, (done: Function) => {
      runCase('testDataValidator0005', async (): Promise<void> => {
        const result: boolean = DataValidator.isNumber(NaN);
        addLog('testDataValidator0005: isNumber(NaN)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isNumber(42)).assertTrue();
        expect(DataValidator.isNumber(0)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_0600
     * @tc.name: testDataValidator0006
     * @tc.desc: Verify isNumber returns false for null input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0006', 0, (done: Function) => {
      runCase('testDataValidator0006', async (): Promise<void> => {
        const result: boolean = DataValidator.isNumber(null);
        addLog('testDataValidator0006: isNumber(null)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isNumber(42)).assertTrue();
        expect(DataValidator.isNumber(null)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_0700
     * @tc.name: testDataValidator0007
     * @tc.desc: Verify isBoolean returns true for boolean input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0007', 0, (done: Function) => {
      runCase('testDataValidator0007', async (): Promise<void> => {
        const result: boolean = DataValidator.isBoolean(true);
        addLog('testDataValidator0007: isBoolean(true)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isBoolean(false)).assertTrue();
        expect(DataValidator.isBoolean('true' as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_0800
     * @tc.name: testDataValidator0008
     * @tc.desc: Verify isBoolean returns false for string input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0008', 0, (done: Function) => {
      runCase('testDataValidator0008', async (): Promise<void> => {
        const strValue: string = 'true';
        const result: boolean = DataValidator.isBoolean(strValue as Object);
        addLog('testDataValidator0008: isBoolean("true")=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isBoolean(true)).assertTrue();
        expect(DataValidator.isBoolean(1 as Object)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_0900
     * @tc.name: testDataValidator0009
     * @tc.desc: Verify isValidKey returns true for normal key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0009', 0, (done: Function) => {
      runCase('testDataValidator0009', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidKey('user_name');
        addLog('testDataValidator0009: isValidKey(user_name)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidKey('')).assertFalse();
        expect(DataValidator.isValidKey('another_valid_key')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1000
     * @tc.name: testDataValidator0010
     * @tc.desc: Verify isValidKey returns false for empty key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0010', 0, (done: Function) => {
      runCase('testDataValidator0010', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidKey('');
        addLog('testDataValidator0010: isValidKey("")=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidKey('valid_key')).assertTrue();
        expect(DataValidator.isValidKey('a')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1100
     * @tc.name: testDataValidator0011
     * @tc.desc: Verify isValidKey returns false for key exceeding max length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0011', 0, (done: Function) => {
      runCase('testDataValidator0011', async (): Promise<void> => {
        let longKey: string = '';
        for (let i = 0; i < DataStoreConstants.MAX_KEY_LENGTH + 1; i++) {
          longKey += 'a';
        }
        const result: boolean = DataValidator.isValidKey(longKey);
        addLog('testDataValidator0011: isValidKey(longKey)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidKey('valid_key')).assertTrue();
        expect(DataValidator.isValidKey('short')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1200
     * @tc.name: testDataValidator0012
     * @tc.desc: Verify isValidKey returns false for key with control characters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0012', 0, (done: Function) => {
      runCase('testDataValidator0012', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidKey('key\x00name');
        addLog('testDataValidator0012: isValidKey(key\\x00name)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidKey('valid_key')).assertTrue();
        expect(DataValidator.isValidKey('no\x00ctrl')).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_1300
     * @tc.name: testDataValidator0013
     * @tc.desc: Verify isValidValue returns true for null value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0013', 0, (done: Function) => {
      runCase('testDataValidator0013', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidValue(null);
        addLog('testDataValidator0013: isValidValue(null)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidValue('non-null')).assertTrue();
        expect(DataValidator.isValidValue(0)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1400
     * @tc.name: testDataValidator0014
     * @tc.desc: Verify isValidValue returns true for valid string value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0014', 0, (done: Function) => {
      runCase('testDataValidator0014', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidValue('test_value');
        addLog('testDataValidator0014: isValidValue(test_value)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidValue(null)).assertTrue();
        expect(DataValidator.isValidValue(42)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1500
     * @tc.name: testDataValidator0015
     * @tc.desc: Verify isValidValue returns false for NaN number.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0015', 0, (done: Function) => {
      runCase('testDataValidator0015', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidValue(NaN);
        addLog('testDataValidator0015: isValidValue(NaN)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidValue('valid')).assertTrue();
        expect(DataValidator.isValidValue(0)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1600
     * @tc.name: testDataValidator0016
     * @tc.desc: Verify isValidValue returns true for boolean value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0016', 0, (done: Function) => {
      runCase('testDataValidator0016', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidValue(false);
        addLog('testDataValidator0016: isValidValue(false)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidValue(true)).assertTrue();
        expect(DataValidator.isValidValue(null)).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_1700
     * @tc.name: testDataValidator0017
     * @tc.desc: Verify isValidTableName returns true for valid table name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0017', 0, (done: Function) => {
      runCase('testDataValidator0017', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidTableName('user_table');
        addLog('testDataValidator0017: isValidTableName(user_table)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidTableName('another_valid')).assertTrue();
        expect(DataValidator.isValidTableName('')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1800
     * @tc.name: testDataValidator0018
     * @tc.desc: Verify isValidTableName returns false for name starting with digit.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0018', 0, (done: Function) => {
      runCase('testDataValidator0018', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidTableName('1table');
        addLog('testDataValidator0018: isValidTableName(1table)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidTableName('valid_table')).assertTrue();
        expect(DataValidator.isValidTableName('9bad')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_1900
     * @tc.name: testDataValidator0019
     * @tc.desc: Verify isValidTableName returns false for empty name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0019', 0, (done: Function) => {
      runCase('testDataValidator0019', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidTableName('');
        addLog('testDataValidator0019: isValidTableName("")=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidTableName('valid_table')).assertTrue();
        expect(DataValidator.isValidTableName('_also_valid')).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_2000
     * @tc.name: testDataValidator0020
     * @tc.desc: Verify isValidSQL returns true for normal SELECT statement.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0020', 0, (done: Function) => {
      runCase('testDataValidator0020', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidSQL('SELECT * FROM users WHERE age > 18');
        addLog('testDataValidator0020: isValidSQL(SELECT)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidSQL('INSERT INTO t (c) VALUES (1)')).assertTrue();
        expect(DataValidator.isValidSQL('')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2100
     * @tc.name: testDataValidator0021
     * @tc.desc: Verify isValidSQL returns false for DROP DATABASE statement.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0021', 0, (done: Function) => {
      runCase('testDataValidator0021', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidSQL('DROP DATABASE test_db');
        addLog('testDataValidator0021: isValidSQL(DROP DATABASE)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidSQL('SELECT 1')).assertTrue();
        expect(DataValidator.isValidSQL('DROP TABLE x')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2200
     * @tc.name: testDataValidator0022
     * @tc.desc: Verify isValidSQL returns false for empty SQL.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0022', 0, (done: Function) => {
      runCase('testDataValidator0022', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidSQL('');
        addLog('testDataValidator0022: isValidSQL("")=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidSQL('SELECT 1')).assertTrue();
        expect(DataValidator.isValidSQL('UPDATE t SET c=1')).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_2300
     * @tc.name: testDataValidator0023
     * @tc.desc: Verify isValidBatchSize returns true for valid batch size.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0023', 0, (done: Function) => {
      runCase('testDataValidator0023', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidBatchSize(100);
        addLog('testDataValidator0023: isValidBatchSize(100)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidBatchSize(1)).assertTrue();
        expect(DataValidator.isValidBatchSize(0)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2400
     * @tc.name: testDataValidator0024
     * @tc.desc: Verify isValidBatchSize returns false for zero.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0024', 0, (done: Function) => {
      runCase('testDataValidator0024', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidBatchSize(0);
        addLog('testDataValidator0024: isValidBatchSize(0)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidBatchSize(100)).assertTrue();
        expect(DataValidator.isValidBatchSize(-1)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2500
     * @tc.name: testDataValidator0025
     * @tc.desc: Verify isValidBatchSize returns false for size exceeding max.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0025', 0, (done: Function) => {
      runCase('testDataValidator0025', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidBatchSize(DataStoreConstants.MAX_BATCH_SIZE + 1);
        addLog('testDataValidator0025: isValidBatchSize(max+1)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidBatchSize(100)).assertTrue();
        expect(DataValidator.isValidBatchSize(200)).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_2600
     * @tc.name: testDataValidator0026
     * @tc.desc: Verify isValidIndex returns true for valid index within range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0026', 0, (done: Function) => {
      runCase('testDataValidator0026', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidIndex(5, 10);
        addLog('testDataValidator0026: isValidIndex(5,10)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidIndex(0, 10)).assertTrue();
        expect(DataValidator.isValidIndex(-1, 10)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2700
     * @tc.name: testDataValidator0027
     * @tc.desc: Verify isValidIndex returns false for negative index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0027', 0, (done: Function) => {
      runCase('testDataValidator0027', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidIndex(-1, 10);
        addLog('testDataValidator0027: isValidIndex(-1,10)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidIndex(5, 10)).assertTrue();
        expect(DataValidator.isValidIndex(0, 10)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_2800
     * @tc.name: testDataValidator0028
     * @tc.desc: Verify isValidIndex returns false for index at boundary (equal to max).
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0028', 0, (done: Function) => {
      runCase('testDataValidator0028', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidIndex(10, 10);
        addLog('testDataValidator0028: isValidIndex(10,10)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidIndex(5, 10)).assertTrue();
        expect(DataValidator.isValidIndex(9, 10)).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_2900
     * @tc.name: testDataValidator0029
     * @tc.desc: Verify isValidPriority returns true for priority within 0-10.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0029', 0, (done: Function) => {
      runCase('testDataValidator0029', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidPriority(5);
        addLog('testDataValidator0029: isValidPriority(5)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidPriority(0)).assertTrue();
        expect(DataValidator.isValidPriority(-1)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3000
     * @tc.name: testDataValidator0030
     * @tc.desc: Verify isValidPriority returns false for priority out of range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0030', 0, (done: Function) => {
      runCase('testDataValidator0030', async (): Promise<void> => {
        const resultLow: boolean = DataValidator.isValidPriority(-1);
        const resultHigh: boolean = DataValidator.isValidPriority(11);
        addLog('testDataValidator0030: isValidPriority(-1)=%{public}s, isValidPriority(11)=%{public}s',
          String(resultLow), String(resultHigh));
        expect(resultLow).assertFalse();
        expect(resultHigh).assertFalse();
        expect(DataValidator.isValidPriority(5)).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_3100
     * @tc.name: testDataValidator0031
     * @tc.desc: Verify isValidVersion returns true for positive integer version.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0031', 0, (done: Function) => {
      runCase('testDataValidator0031', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidVersion(3);
        addLog('testDataValidator0031: isValidVersion(3)=%{public}s', String(result));
        expect(result).assertTrue();
        expect(DataValidator.isValidVersion(1)).assertTrue();
        expect(DataValidator.isValidVersion(0)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3200
     * @tc.name: testDataValidator0032
     * @tc.desc: Verify isValidVersion returns false for zero version.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0032', 0, (done: Function) => {
      runCase('testDataValidator0032', async (): Promise<void> => {
        const result: boolean = DataValidator.isValidVersion(0);
        addLog('testDataValidator0032: isValidVersion(0)=%{public}s', String(result));
        expect(result).assertFalse();
        expect(DataValidator.isValidVersion(1)).assertTrue();
        expect(DataValidator.isValidVersion(-1)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_3300
     * @tc.name: testDataValidator0033
     * @tc.desc: Verify isNull returns true for null and false for non-null.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0033', 0, (done: Function) => {
      runCase('testDataValidator0033', async (): Promise<void> => {
        expect(DataValidator.isNull(null)).assertTrue();
        const val: number = 42;
        expect(DataValidator.isNull(val as Object)).assertFalse();
        const undefVal: string = '';
        expect(DataValidator.isNull(undefVal as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3400
     * @tc.name: testDataValidator0034
     * @tc.desc: Verify isUndefined returns true for undefined.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0034', 0, (done: Function) => {
      runCase('testDataValidator0034', async (): Promise<void> => {
        expect(DataValidator.isUndefined(undefined)).assertTrue();
        const val: string = 'hello';
        expect(DataValidator.isUndefined(val as Object)).assertFalse();
        const nullVal: string = '';
        expect(DataValidator.isUndefined(nullVal as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3500
     * @tc.name: testDataValidator0035
     * @tc.desc: Verify isNullOrUndefined returns true for null or undefined.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0035', 0, (done: Function) => {
      runCase('testDataValidator0035', async (): Promise<void> => {
        expect(DataValidator.isNullOrUndefined(null)).assertTrue();
        expect(DataValidator.isNullOrUndefined(undefined)).assertTrue();
        const val: number = 0;
        expect(DataValidator.isNullOrUndefined(val as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3600
     * @tc.name: testDataValidator0036
     * @tc.desc: Verify isNull returns false for empty string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0036', 0, (done: Function) => {
      runCase('testDataValidator0036', async (): Promise<void> => {
        const val: string = '';
        expect(DataValidator.isNull(val as Object)).assertFalse();
        expect(DataValidator.isNull(null)).assertTrue();
        expect(DataValidator.isNull(0 as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3700
     * @tc.name: testDataValidator0037
     * @tc.desc: Verify isUndefined returns false for null.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0037', 0, (done: Function) => {
      runCase('testDataValidator0037', async (): Promise<void> => {
        expect(DataValidator.isUndefined(undefined)).assertTrue();
        const nullStr: string = '';
        expect(DataValidator.isUndefined(nullStr as Object)).assertFalse();
        expect(DataValidator.isUndefined('test' as Object)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_3800
     * @tc.name: testDataValidator0038
     * @tc.desc: Verify isNullOrUndefined returns false for valid value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0038', 0, (done: Function) => {
      runCase('testDataValidator0038', async (): Promise<void> => {
        const val: boolean = false;
        expect(DataValidator.isNullOrUndefined(val as Object)).assertFalse();
        expect(DataValidator.isNullOrUndefined(null)).assertTrue();
        expect(DataValidator.isNullOrUndefined(undefined)).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_3900
     * @tc.name: testDataValidator0039
     * @tc.desc: Verify isValidStoreName returns true for valid name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0039', 0, (done: Function) => {
      runCase('testDataValidator0039', async (): Promise<void> => {
        expect(DataValidator.isValidStoreName('myStore')).assertTrue();
        expect(DataValidator.isValidStoreName('store_v2')).assertTrue();
        expect(DataValidator.isValidStoreName('')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4000
     * @tc.name: testDataValidator0040
     * @tc.desc: Verify isValidStoreName returns false for name starting with digit.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0040', 0, (done: Function) => {
      runCase('testDataValidator0040', async (): Promise<void> => {
        expect(DataValidator.isValidStoreName('1store')).assertFalse();
        expect(DataValidator.isValidStoreName('')).assertFalse();
        expect(DataValidator.isValidStoreName('valid_store')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4100
     * @tc.name: testDataValidator0041
     * @tc.desc: Verify isValidStoreName returns false for empty or too-long name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataValidator0041', 0, (done: Function) => {
      runCase('testDataValidator0041', async (): Promise<void> => {
        expect(DataValidator.isValidStoreName('')).assertFalse();
        expect(DataValidator.isValidStoreName('valid_name')).assertTrue();
        let longName: string = '';
        for (let i = 0; i < 65; i++) {
          longName += 'a';
        }
        expect(DataValidator.isValidStoreName(longName)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_4200
     * @tc.name: testDataValidator0042
     * @tc.desc: Verify isValidCapacity returns true for valid capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0042', 0, (done: Function) => {
      runCase('testDataValidator0042', async (): Promise<void> => {
        expect(DataValidator.isValidCapacity(100, 200)).assertTrue();
        expect(DataValidator.isValidCapacity(1, 10)).assertTrue();
        expect(DataValidator.isValidCapacity(0, 200)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4300
     * @tc.name: testDataValidator0043
     * @tc.desc: Verify isValidCapacity returns false for zero or exceeding max.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0043', 0, (done: Function) => {
      runCase('testDataValidator0043', async (): Promise<void> => {
        expect(DataValidator.isValidCapacity(0, 200)).assertFalse();
        expect(DataValidator.isValidCapacity(201, 200)).assertFalse();
        expect(DataValidator.isValidCapacity(1.5, 200)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4400
     * @tc.name: testDataValidator0044
     * @tc.desc: Verify isValidTimestamp returns true for positive finite value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0044', 0, (done: Function) => {
      runCase('testDataValidator0044', async (): Promise<void> => {
        expect(DataValidator.isValidTimestamp(Date.now())).assertTrue();
        expect(DataValidator.isValidTimestamp(1000)).assertTrue();
        expect(DataValidator.isValidTimestamp(0)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4500
     * @tc.name: testDataValidator0045
     * @tc.desc: Verify isValidTimestamp returns false for zero, negative, or NaN.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0045', 0, (done: Function) => {
      runCase('testDataValidator0045', async (): Promise<void> => {
        expect(DataValidator.isValidTimestamp(0)).assertFalse();
        expect(DataValidator.isValidTimestamp(-100)).assertFalse();
        expect(DataValidator.isValidTimestamp(NaN)).assertFalse();
        expect(DataValidator.isValidTimestamp(Infinity)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4600
     * @tc.name: testDataValidator0046
     * @tc.desc: Verify isValidPort returns true for valid port range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0046', 0, (done: Function) => {
      runCase('testDataValidator0046', async (): Promise<void> => {
        expect(DataValidator.isValidPort(8080)).assertTrue();
        expect(DataValidator.isValidPort(1)).assertTrue();
        expect(DataValidator.isValidPort(65535)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4700
     * @tc.name: testDataValidator0047
     * @tc.desc: Verify isValidPort returns false for out-of-range or non-integer.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0047', 0, (done: Function) => {
      runCase('testDataValidator0047', async (): Promise<void> => {
        expect(DataValidator.isValidPort(0)).assertFalse();
        expect(DataValidator.isValidPort(65536)).assertFalse();
        expect(DataValidator.isValidPort(-1)).assertFalse();
        expect(DataValidator.isValidPort(3.14)).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_4800
     * @tc.name: testDataValidator0048
     * @tc.desc: Verify isValidDeviceId returns true for valid device ID.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0048', 0, (done: Function) => {
      runCase('testDataValidator0048', async (): Promise<void> => {
        expect(DataValidator.isValidDeviceId('device-001')).assertTrue();
        expect(DataValidator.isValidDeviceId('ABC_123')).assertTrue();
        expect(DataValidator.isValidDeviceId('')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_4900
     * @tc.name: testDataValidator0049
     * @tc.desc: Verify isValidDeviceId returns false for empty or invalid chars.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0049', 0, (done: Function) => {
      runCase('testDataValidator0049', async (): Promise<void> => {
        expect(DataValidator.isValidDeviceId('')).assertFalse();
        expect(DataValidator.isValidDeviceId('device@001')).assertFalse();
        expect(DataValidator.isValidDeviceId('has space')).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_5000
     * @tc.name: testDataValidator0050
     * @tc.desc: Verify isValidEncryptionMode accepts valid modes and rejects invalid.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0050', 0, (done: Function) => {
      runCase('testDataValidator0050', async (): Promise<void> => {
        expect(DataValidator.isValidEncryptionMode(DataStoreConstants.ENCRYPTION_AES_128)).assertTrue();
        expect(DataValidator.isValidEncryptionMode(DataStoreConstants.ENCRYPTION_AES_256)).assertTrue();
        expect(DataValidator.isValidEncryptionMode(DataStoreConstants.ENCRYPTION_SM4)).assertTrue();
        expect(DataValidator.isValidEncryptionMode('DES')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5100
     * @tc.name: testDataValidator0051
     * @tc.desc: Verify isValidHashAlgorithm accepts valid algorithms.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0051', 0, (done: Function) => {
      runCase('testDataValidator0051', async (): Promise<void> => {
        expect(DataValidator.isValidHashAlgorithm(DataStoreConstants.HASH_SHA256)).assertTrue();
        expect(DataValidator.isValidHashAlgorithm(DataStoreConstants.HASH_SHA512)).assertTrue();
        expect(DataValidator.isValidHashAlgorithm(DataStoreConstants.HASH_SM3)).assertTrue();
        expect(DataValidator.isValidHashAlgorithm('MD5')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5200
     * @tc.name: testDataValidator0052
     * @tc.desc: Verify isValidSyncMode accepts valid sync modes.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0052', 0, (done: Function) => {
      runCase('testDataValidator0052', async (): Promise<void> => {
        expect(DataValidator.isValidSyncMode(DataStoreConstants.SYNC_MODE_REAL_TIME)).assertTrue();
        expect(DataValidator.isValidSyncMode(DataStoreConstants.SYNC_MODE_PERIODIC)).assertTrue();
        expect(DataValidator.isValidSyncMode(DataStoreConstants.SYNC_MODE_MANUAL)).assertTrue();
        expect(DataValidator.isValidSyncMode('auto')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5300
     * @tc.name: testDataValidator0053
     * @tc.desc: Verify isValidConflictPolicy accepts valid policies.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0053', 0, (done: Function) => {
      runCase('testDataValidator0053', async (): Promise<void> => {
        expect(DataValidator.isValidConflictPolicy(DataStoreConstants.CONFLICT_POLICY_LOCAL_FIRST)).assertTrue();
        expect(DataValidator.isValidConflictPolicy(DataStoreConstants.CONFLICT_POLICY_REMOTE_FIRST)).assertTrue();
        expect(DataValidator.isValidConflictPolicy(DataStoreConstants.CONFLICT_POLICY_TIMESTAMP)).assertTrue();
        expect(DataValidator.isValidConflictPolicy(DataStoreConstants.CONFLICT_POLICY_MERGE)).assertTrue();
        expect(DataValidator.isValidConflictPolicy('random')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5400
     * @tc.name: testDataValidator0054
     * @tc.desc: Verify isValidLogLevel accepts valid levels 0-4.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0054', 0, (done: Function) => {
      runCase('testDataValidator0054', async (): Promise<void> => {
        expect(DataValidator.isValidLogLevel(DataStoreConstants.LOG_LEVEL_DEBUG)).assertTrue();
        expect(DataValidator.isValidLogLevel(DataStoreConstants.LOG_LEVEL_INFO)).assertTrue();
        expect(DataValidator.isValidLogLevel(DataStoreConstants.LOG_LEVEL_NONE)).assertTrue();
        expect(DataValidator.isValidLogLevel(5)).assertFalse();
        expect(DataValidator.isValidLogLevel(-1)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5500
     * @tc.name: testDataValidator0055
     * @tc.desc: Verify isValidSecurityLevel accepts S1-S4.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0055', 0, (done: Function) => {
      runCase('testDataValidator0055', async (): Promise<void> => {
        expect(DataValidator.isValidSecurityLevel(DataStoreConstants.SECURITY_LEVEL_S1)).assertTrue();
        expect(DataValidator.isValidSecurityLevel(DataStoreConstants.SECURITY_LEVEL_S2)).assertTrue();
        expect(DataValidator.isValidSecurityLevel(DataStoreConstants.SECURITY_LEVEL_S3)).assertTrue();
        expect(DataValidator.isValidSecurityLevel(DataStoreConstants.SECURITY_LEVEL_S4)).assertTrue();
        expect(DataValidator.isValidSecurityLevel('S5')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5600
     * @tc.name: testDataValidator0056
     * @tc.desc: Verify isValidDataType accepts valid data types.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0056', 0, (done: Function) => {
      runCase('testDataValidator0056', async (): Promise<void> => {
        expect(DataValidator.isValidDataType('string')).assertTrue();
        expect(DataValidator.isValidDataType('number')).assertTrue();
        expect(DataValidator.isValidDataType('boolean')).assertTrue();
        expect(DataValidator.isValidDataType('object')).assertTrue();
        expect(DataValidator.isValidDataType('array')).assertTrue();
        expect(DataValidator.isValidDataType('null')).assertTrue();
        expect(DataValidator.isValidDataType('undefined_type')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5700
     * @tc.name: testDataValidator0057
     * @tc.desc: Verify isValidStoreType accepts valid store types.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0057', 0, (done: Function) => {
      runCase('testDataValidator0057', async (): Promise<void> => {
        expect(DataValidator.isValidStoreType('preferences')).assertTrue();
        expect(DataValidator.isValidStoreType('rdb')).assertTrue();
        expect(DataValidator.isValidStoreType('array')).assertTrue();
        expect(DataValidator.isValidStoreType('map')).assertTrue();
        expect(DataValidator.isValidStoreType('queue')).assertTrue();
        expect(DataValidator.isValidStoreType('record')).assertTrue();
        expect(DataValidator.isValidStoreType('file')).assertFalse();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_VALIDATOR_5800
     * @tc.name: testDataValidator0058
     * @tc.desc: Verify validateKeyRange returns true for value within range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0058', 0, (done: Function) => {
      runCase('testDataValidator0058', async (): Promise<void> => {
        expect(DataValidator.validateKeyRange(50, 0, 100)).assertTrue();
        expect(DataValidator.validateKeyRange(0, 0, 100)).assertTrue();
        expect(DataValidator.validateKeyRange(100, 0, 100)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_5900
     * @tc.name: testDataValidator0059
     * @tc.desc: Verify validateKeyRange returns false for out-of-range or NaN.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0059', 0, (done: Function) => {
      runCase('testDataValidator0059', async (): Promise<void> => {
        expect(DataValidator.validateKeyRange(-1, 0, 100)).assertFalse();
        expect(DataValidator.validateKeyRange(101, 0, 100)).assertFalse();
        expect(DataValidator.validateKeyRange(NaN, 0, 100)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6000
     * @tc.name: testDataValidator0060
     * @tc.desc: Verify validateStringLength returns true for valid length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0060', 0, (done: Function) => {
      runCase('testDataValidator0060', async (): Promise<void> => {
        expect(DataValidator.validateStringLength('hello', 1, 10)).assertTrue();
        expect(DataValidator.validateStringLength('a', 1, 100)).assertTrue();
        expect(DataValidator.validateStringLength('', 1, 10)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6100
     * @tc.name: testDataValidator0061
     * @tc.desc: Verify validateStringLength returns false for too long or null.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0061', 0, (done: Function) => {
      runCase('testDataValidator0061', async (): Promise<void> => {
        expect(DataValidator.validateStringLength('hello world', 1, 5)).assertFalse();
        expect(DataValidator.validateStringLength('', 1, 10)).assertFalse();
        expect(DataValidator.validateStringLength('ok', 1, 10)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6200
     * @tc.name: testDataValidator0062
     * @tc.desc: Verify validateArrayLength accepts valid lengths.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0062', 0, (done: Function) => {
      runCase('testDataValidator0062', async (): Promise<void> => {
        expect(DataValidator.validateArrayLength(0, 100)).assertTrue();
        expect(DataValidator.validateArrayLength(50, 100)).assertTrue();
        expect(DataValidator.validateArrayLength(100, 100)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6300
     * @tc.name: testDataValidator0063
     * @tc.desc: Verify validateArrayLength rejects negative or non-integer.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0063', 0, (done: Function) => {
      runCase('testDataValidator0063', async (): Promise<void> => {
        expect(DataValidator.validateArrayLength(-1, 100)).assertFalse();
        expect(DataValidator.validateArrayLength(101, 100)).assertFalse();
        expect(DataValidator.validateArrayLength(1.5, 100)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6400
     * @tc.name: testDataValidator0064
     * @tc.desc: Verify validateMapSize accepts valid sizes.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0064', 0, (done: Function) => {
      runCase('testDataValidator0064', async (): Promise<void> => {
        expect(DataValidator.validateMapSize(0, 1000)).assertTrue();
        expect(DataValidator.validateMapSize(500, 1000)).assertTrue();
        expect(DataValidator.validateMapSize(1000, 1000)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6500
     * @tc.name: testDataValidator0065
     * @tc.desc: Verify validateMapSize rejects negative or exceeding max.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0065', 0, (done: Function) => {
      runCase('testDataValidator0065', async (): Promise<void> => {
        expect(DataValidator.validateMapSize(-1, 1000)).assertFalse();
        expect(DataValidator.validateMapSize(1001, 1000)).assertFalse();
        expect(DataValidator.validateMapSize(1.5, 1000)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6600
     * @tc.name: testDataValidator0066
     * @tc.desc: Verify validateQueueCapacity accepts valid positive capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0066', 0, (done: Function) => {
      runCase('testDataValidator0066', async (): Promise<void> => {
        expect(DataValidator.validateQueueCapacity(1, 10000)).assertTrue();
        expect(DataValidator.validateQueueCapacity(5000, 10000)).assertTrue();
        expect(DataValidator.validateQueueCapacity(10000, 10000)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6700
     * @tc.name: testDataValidator0067
     * @tc.desc: Verify validateQueueCapacity rejects zero or exceeding max.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0067', 0, (done: Function) => {
      runCase('testDataValidator0067', async (): Promise<void> => {
        expect(DataValidator.validateQueueCapacity(0, 10000)).assertFalse();
        expect(DataValidator.validateQueueCapacity(10001, 10000)).assertFalse();
        expect(DataValidator.validateQueueCapacity(1.5, 10000)).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6800
     * @tc.name: testDataValidator0068
     * @tc.desc: Verify validateRecordFields accepts valid field count.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0068', 0, (done: Function) => {
      runCase('testDataValidator0068', async (): Promise<void> => {
        expect(DataValidator.validateRecordFields(1, 256)).assertTrue();
        expect(DataValidator.validateRecordFields(128, 256)).assertTrue();
        expect(DataValidator.validateRecordFields(256, 256)).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_VALIDATOR_6900
     * @tc.name: testDataValidator0069
     * @tc.desc: Verify validateRecordFields rejects zero or exceeding max.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataValidator0069', 0, (done: Function) => {
      runCase('testDataValidator0069', async (): Promise<void> => {
        expect(DataValidator.validateRecordFields(0, 256)).assertFalse();
        expect(DataValidator.validateRecordFields(257, 256)).assertFalse();
        expect(DataValidator.validateRecordFields(1.5, 256)).assertFalse();
      }, done);
    });
  });
}
