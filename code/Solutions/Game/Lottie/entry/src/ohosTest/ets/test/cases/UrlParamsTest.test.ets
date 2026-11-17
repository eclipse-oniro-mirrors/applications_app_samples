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
import url from '@ohos.url';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.URL;


export default function urlParamsTest(): void {
  describe('UrlParamsTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0100
     * @tc.name urlParamsFromString001
     * @tc.desc Verify URLParams parses a query string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsFromString_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsFromString_001 begin');
      const params: url.URLParams = new url.URLParams('a=1&b=2');
      Logger.info(TAG, 'urlParamsFromString_001, check01=' + JSON.stringify(params.toString()));
      expect(params.toString()).assertEqual('a=1&b=2');
      Logger.info(TAG, 'urlParamsFromString_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0200
     * @tc.name urlParamsEmpty002
     * @tc.desc Verify URLParams built without arguments is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsEmpty_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsEmpty_002 begin');
      const params: url.URLParams = new url.URLParams();
      Logger.info(TAG, 'urlParamsEmpty_002, check01=' + JSON.stringify(params.toString()));
      expect(params.toString()).assertEqual('');
      Logger.info(TAG, 'urlParamsEmpty_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0300
     * @tc.name urlParamsGet003
     * @tc.desc Verify get reads a stored parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsGet_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsGet_003 begin');
      const params: url.URLParams = new url.URLParams('a=1&b=2');
      Logger.info(TAG, 'urlParamsGet_003, check01=' + JSON.stringify(params.get('b')));
      expect(params.get('b')).assertEqual('2');
      Logger.info(TAG, 'urlParamsGet_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0400
     * @tc.name urlParamsHas004
     * @tc.desc Verify has distinguishes present and absent parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsHas_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsHas_004 begin');
      const params: url.URLParams = new url.URLParams('a=1');
      Logger.info(TAG, 'urlParamsHas_004, check01=' + JSON.stringify(params.has('a')));
      expect(params.has('a')).assertTrue();
      Logger.info(TAG, 'urlParamsHas_004, check02=' + JSON.stringify(params.has('z')));
      expect(params.has('z')).assertFalse();
      Logger.info(TAG, 'urlParamsHas_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0500
     * @tc.name urlParamsAppend005
     * @tc.desc Verify append adds a new parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsAppend_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsAppend_005 begin');
      const params: url.URLParams = new url.URLParams('a=1');
      params.append('b', '2');
      Logger.info(TAG, 'urlParamsAppend_005, check01=' + JSON.stringify(params.get('b')));
      expect(params.get('b')).assertEqual('2');
      Logger.info(TAG, 'urlParamsAppend_005, check02=' + JSON.stringify(params.toString()));
      expect(params.toString()).assertEqual('a=1&b=2');
      Logger.info(TAG, 'urlParamsAppend_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0600
     * @tc.name urlParamsGetAll006
     * @tc.desc Verify getAll returns every value of a repeated key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsGetAll_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsGetAll_006 begin');
      const params: url.URLParams = new url.URLParams('a=1');
      params.append('a', '2');
      const values: Array<string> = params.getAll('a');
      Logger.info(TAG, 'urlParamsGetAll_006, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(2);
      Logger.info(TAG, 'urlParamsGetAll_006, check02=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('2');
      Logger.info(TAG, 'urlParamsGetAll_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0700
     * @tc.name urlParamsDelete007
     * @tc.desc Verify delete removes a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsDelete_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsDelete_007 begin');
      const params: url.URLParams = new url.URLParams('a=1&b=2');
      params.delete('a');
      Logger.info(TAG, 'urlParamsDelete_007, check01=' + JSON.stringify(params.has('a')));
      expect(params.has('a')).assertFalse();
      Logger.info(TAG, 'urlParamsDelete_007, check02=' + JSON.stringify(params.toString()));
      expect(params.toString()).assertEqual('b=2');
      Logger.info(TAG, 'urlParamsDelete_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0800
     * @tc.name urlParamsSet008
     * @tc.desc Verify set overwrites the value of a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsSet_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsSet_008 begin');
      const params: url.URLParams = new url.URLParams('a=1&b=2');
      params.set('a', '9');
      Logger.info(TAG, 'urlParamsSet_008, check01=' + JSON.stringify(params.get('a')));
      expect(params.get('a')).assertEqual('9');
      Logger.info(TAG, 'urlParamsSet_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_0900
     * @tc.name urlParamsSort009
     * @tc.desc Verify sort orders the parameters by key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsSort_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsSort_009 begin');
      const params: url.URLParams = new url.URLParams('b=2&a=1');
      params.sort();
      Logger.info(TAG, 'urlParamsSort_009, check01=' + JSON.stringify(params.toString()));
      expect(params.toString()).assertEqual('a=1&b=2');
      Logger.info(TAG, 'urlParamsSort_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_PARAMS_1000
     * @tc.name urlParamsForEach010
     * @tc.desc Verify forEach visits every parameter exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlParamsForEach_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlParamsForEach_010 begin');
      const params: url.URLParams = new url.URLParams('a=1&b=2');
      let visits: number = 0;
      params.forEach((value: string, key: string): void => {
        visits++;
      });
      Logger.info(TAG, 'urlParamsForEach_010, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(2);
      Logger.info(TAG, 'urlParamsForEach_010 end');
    });

  });
}
