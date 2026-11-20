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
import { describe, it, expect } from '@ohos/hypium';
import { formatStorageSize } from '../../../main/ets/model/StorageQuery';
import { logCase, logAssertion } from './StorageTestSupport';

export default function storageFormat09Test(): void {
  describe('StorageFormat09', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1000
     * @tc.name AppFsSpace_Format_0825
     * @tc.desc bytes=-1024 precision=default; reject negative unit count before formatting
     */
    it('AppFsSpace_Format_0825', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0825';
      const bytes: number = -1024;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0700
     * @tc.name AppFsSpace_Format_0826
     * @tc.desc bytes=-1024 precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0826', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0826';
      const bytes: number = -1024;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0800
     * @tc.name AppFsSpace_Format_0827
     * @tc.desc bytes=-1024 precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0827', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0827';
      const bytes: number = -1024;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0900
     * @tc.name AppFsSpace_Format_0828
     * @tc.desc bytes=-1024 precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0828', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0828';
      const bytes: number = -1024;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1000
     * @tc.name AppFsSpace_Format_0829
     * @tc.desc bytes=-1024 precision=Number.NaN; bytes validation wins over NaN precision
     */
    it('AppFsSpace_Format_0829', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0829';
      const bytes: number = -1024;
      const precision: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1100
     * @tc.name AppFsSpace_Format_0830
     * @tc.desc bytes=-1024 precision=Number.POSITIVE_INFINITY; bytes validation wins over positive infinite precision
     */
    it('AppFsSpace_Format_0830', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0830';
      const bytes: number = -1024;
      const precision: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1200
     * @tc.name AppFsSpace_Format_0831
     * @tc.desc bytes=-1024 precision=Number.NEGATIVE_INFINITY; bytes validation wins over negative infinite precision
     */
    it('AppFsSpace_Format_0831', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0831';
      const bytes: number = -1024;
      const precision: number = Number.NEGATIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1100
     * @tc.name AppFsSpace_Format_0832
     * @tc.desc bytes=0.5 precision=0; reject sub-byte fraction before formatting
     */
    it('AppFsSpace_Format_0832', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0832';
      const bytes: number = 0.5;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1200
     * @tc.name AppFsSpace_Format_0833
     * @tc.desc bytes=0.5 precision=1; reject sub-byte fraction before formatting
     */
    it('AppFsSpace_Format_0833', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0833';
      const bytes: number = 0.5;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1300
     * @tc.name AppFsSpace_Format_0834
     * @tc.desc bytes=0.5 precision=2; reject sub-byte fraction before formatting
     */
    it('AppFsSpace_Format_0834', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0834';
      const bytes: number = 0.5;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1400
     * @tc.name AppFsSpace_Format_0835
     * @tc.desc bytes=0.5 precision=3; reject sub-byte fraction before formatting
     */
    it('AppFsSpace_Format_0835', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0835';
      const bytes: number = 0.5;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1500
     * @tc.name AppFsSpace_Format_0836
     * @tc.desc bytes=0.5 precision=default; reject sub-byte fraction before formatting
     */
    it('AppFsSpace_Format_0836', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0836';
      const bytes: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1300
     * @tc.name AppFsSpace_Format_0837
     * @tc.desc bytes=0.5 precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0837', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0837';
      const bytes: number = 0.5;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1400
     * @tc.name AppFsSpace_Format_0838
     * @tc.desc bytes=0.5 precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0838', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0838';
      const bytes: number = 0.5;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1500
     * @tc.name AppFsSpace_Format_0839
     * @tc.desc bytes=0.5 precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0839', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0839';
      const bytes: number = 0.5;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1600
     * @tc.name AppFsSpace_Format_0840
     * @tc.desc bytes=0.5 precision=Number.NaN; bytes validation wins over NaN precision
     */
    it('AppFsSpace_Format_0840', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0840';
      const bytes: number = 0.5;
      const precision: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1700
     * @tc.name AppFsSpace_Format_0841
     * @tc.desc bytes=0.5 precision=Number.POSITIVE_INFINITY; bytes validation wins over positive infinite precision
     */
    it('AppFsSpace_Format_0841', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0841';
      const bytes: number = 0.5;
      const precision: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1800
     * @tc.name AppFsSpace_Format_0842
     * @tc.desc bytes=0.5 precision=Number.NEGATIVE_INFINITY; bytes validation wins over negative infinite precision
     */
    it('AppFsSpace_Format_0842', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0842';
      const bytes: number = 0.5;
      const precision: number = Number.NEGATIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1600
     * @tc.name AppFsSpace_Format_0843
     * @tc.desc bytes=1023.5 precision=0; reject fraction below KiB before formatting
     */
    it('AppFsSpace_Format_0843', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0843';
      const bytes: number = 1023.5;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1700
     * @tc.name AppFsSpace_Format_0844
     * @tc.desc bytes=1023.5 precision=1; reject fraction below KiB before formatting
     */
    it('AppFsSpace_Format_0844', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0844';
      const bytes: number = 1023.5;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1800
     * @tc.name AppFsSpace_Format_0845
     * @tc.desc bytes=1023.5 precision=2; reject fraction below KiB before formatting
     */
    it('AppFsSpace_Format_0845', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0845';
      const bytes: number = 1023.5;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_1900
     * @tc.name AppFsSpace_Format_0846
     * @tc.desc bytes=1023.5 precision=3; reject fraction below KiB before formatting
     */
    it('AppFsSpace_Format_0846', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0846';
      const bytes: number = 1023.5;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2000
     * @tc.name AppFsSpace_Format_0847
     * @tc.desc bytes=1023.5 precision=default; reject fraction below KiB before formatting
     */
    it('AppFsSpace_Format_0847', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0847';
      const bytes: number = 1023.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_1900
     * @tc.name AppFsSpace_Format_0848
     * @tc.desc bytes=1023.5 precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0848', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0848';
      const bytes: number = 1023.5;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2000
     * @tc.name AppFsSpace_Format_0849
     * @tc.desc bytes=1023.5 precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0849', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0849';
      const bytes: number = 1023.5;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2100
     * @tc.name AppFsSpace_Format_0850
     * @tc.desc bytes=1023.5 precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0850', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0850';
      const bytes: number = 1023.5;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2200
     * @tc.name AppFsSpace_Format_0851
     * @tc.desc bytes=1023.5 precision=Number.NaN; bytes validation wins over NaN precision
     */
    it('AppFsSpace_Format_0851', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0851';
      const bytes: number = 1023.5;
      const precision: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2300
     * @tc.name AppFsSpace_Format_0852
     * @tc.desc bytes=1023.5 precision=Number.POSITIVE_INFINITY; bytes validation wins over positive infinite precision
     */
    it('AppFsSpace_Format_0852', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0852';
      const bytes: number = 1023.5;
      const precision: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2400
     * @tc.name AppFsSpace_Format_0853
     * @tc.desc bytes=1023.5 precision=Number.NEGATIVE_INFINITY; bytes validation wins over negative infinite precision
     */
    it('AppFsSpace_Format_0853', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0853';
      const bytes: number = 1023.5;
      const precision: number = Number.NEGATIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2100
     * @tc.name AppFsSpace_Format_0854
     * @tc.desc bytes=Number.NaN precision=0; reject NaN byte count before formatting
     */
    it('AppFsSpace_Format_0854', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0854';
      const bytes: number = Number.NaN;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2200
     * @tc.name AppFsSpace_Format_0855
     * @tc.desc bytes=Number.NaN precision=1; reject NaN byte count before formatting
     */
    it('AppFsSpace_Format_0855', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0855';
      const bytes: number = Number.NaN;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2300
     * @tc.name AppFsSpace_Format_0856
     * @tc.desc bytes=Number.NaN precision=2; reject NaN byte count before formatting
     */
    it('AppFsSpace_Format_0856', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0856';
      const bytes: number = Number.NaN;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2400
     * @tc.name AppFsSpace_Format_0857
     * @tc.desc bytes=Number.NaN precision=3; reject NaN byte count before formatting
     */
    it('AppFsSpace_Format_0857', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0857';
      const bytes: number = Number.NaN;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2500
     * @tc.name AppFsSpace_Format_0858
     * @tc.desc bytes=Number.NaN precision=default; reject NaN byte count before formatting
     */
    it('AppFsSpace_Format_0858', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0858';
      const bytes: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2500
     * @tc.name AppFsSpace_Format_0859
     * @tc.desc bytes=Number.NaN precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0859', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0859';
      const bytes: number = Number.NaN;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2600
     * @tc.name AppFsSpace_Format_0860
     * @tc.desc bytes=Number.NaN precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0860', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0860';
      const bytes: number = Number.NaN;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2700
     * @tc.name AppFsSpace_Format_0861
     * @tc.desc bytes=Number.NaN precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0861', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0861';
      const bytes: number = Number.NaN;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2800
     * @tc.name AppFsSpace_Format_0862
     * @tc.desc bytes=Number.NaN precision=Number.NaN; bytes validation wins over NaN precision
     */
    it('AppFsSpace_Format_0862', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0862';
      const bytes: number = Number.NaN;
      const precision: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_2900
     * @tc.name AppFsSpace_Format_0863
     * @tc.desc bytes=Number.NaN precision=Number.POSITIVE_INFINITY;
     *   bytes validation wins over positive infinite precision
     */
    it('AppFsSpace_Format_0863', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0863';
      const bytes: number = Number.NaN;
      const precision: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3000
     * @tc.name AppFsSpace_Format_0864
     * @tc.desc bytes=Number.NaN precision=Number.NEGATIVE_INFINITY;
     *   bytes validation wins over negative infinite precision
     */
    it('AppFsSpace_Format_0864', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0864';
      const bytes: number = Number.NaN;
      const precision: number = Number.NEGATIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2600
     * @tc.name AppFsSpace_Format_0865
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=0; reject positive infinite bytes before formatting
     */
    it('AppFsSpace_Format_0865', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0865';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2700
     * @tc.name AppFsSpace_Format_0866
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=1; reject positive infinite bytes before formatting
     */
    it('AppFsSpace_Format_0866', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0866';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2800
     * @tc.name AppFsSpace_Format_0867
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=2; reject positive infinite bytes before formatting
     */
    it('AppFsSpace_Format_0867', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0867';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_2900
     * @tc.name AppFsSpace_Format_0868
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=3; reject positive infinite bytes before formatting
     */
    it('AppFsSpace_Format_0868', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0868';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_3000
     * @tc.name AppFsSpace_Format_0869
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=default; reject positive infinite bytes before formatting
     */
    it('AppFsSpace_Format_0869', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0869';
      const bytes: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3100
     * @tc.name AppFsSpace_Format_0870
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0870', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0870';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3200
     * @tc.name AppFsSpace_Format_0871
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0871', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0871';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3300
     * @tc.name AppFsSpace_Format_0872
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0872', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0872';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3400
     * @tc.name AppFsSpace_Format_0873
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=Number.NaN; bytes validation wins over NaN precision
     */
    it('AppFsSpace_Format_0873', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0873';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = Number.NaN;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3500
     * @tc.name AppFsSpace_Format_0874
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=Number.POSITIVE_INFINITY;
     *   bytes validation wins over positive infinite precision
     */
    it('AppFsSpace_Format_0874', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0874';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = Number.POSITIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_3600
     * @tc.name AppFsSpace_Format_0875
     * @tc.desc bytes=Number.POSITIVE_INFINITY precision=Number.NEGATIVE_INFINITY;
     *   bytes validation wins over negative infinite precision
     */
    it('AppFsSpace_Format_0875', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0875';
      const bytes: number = Number.POSITIVE_INFINITY;
      const precision: number = Number.NEGATIVE_INFINITY;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_3100
     * @tc.name AppFsSpace_Format_0876
     * @tc.desc bytes=Number.NEGATIVE_INFINITY precision=0; reject negative infinite bytes before formatting
     */
    it('AppFsSpace_Format_0876', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0876';
      const bytes: number = Number.NEGATIVE_INFINITY;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_3200
     * @tc.name AppFsSpace_Format_0877
     * @tc.desc bytes=Number.NEGATIVE_INFINITY precision=1; reject negative infinite bytes before formatting
     */
    it('AppFsSpace_Format_0877', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0877';
      const bytes: number = Number.NEGATIVE_INFINITY;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_3300
     * @tc.name AppFsSpace_Format_0878
     * @tc.desc bytes=Number.NEGATIVE_INFINITY precision=2; reject negative infinite bytes before formatting
     */
    it('AppFsSpace_Format_0878', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0878';
      const bytes: number = Number.NEGATIVE_INFINITY;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_3400
     * @tc.name AppFsSpace_Format_0879
     * @tc.desc bytes=Number.NEGATIVE_INFINITY precision=3; reject negative infinite bytes before formatting
     */
    it('AppFsSpace_Format_0879', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0879';
      const bytes: number = Number.NEGATIVE_INFINITY;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
