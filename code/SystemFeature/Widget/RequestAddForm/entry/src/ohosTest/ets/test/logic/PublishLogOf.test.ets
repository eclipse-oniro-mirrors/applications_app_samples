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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { publishLogOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for publishLogOf (96 cases). */
export default function publishLogOfTest(): void {
  describe('PublishLogOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0001
     * @tc.name      RequestAddForm_PublishLogOf_0001
     * @tc.desc      publishLogOf(succeeded=true, detail="") returns "RequestPublishForm success : "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_PublishLogOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0001 begin`);
      const actual: string = publishLogOf(true, '');
      logInfo(`publishLogOf(succeeded=true, detail=""): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ');
      logInfo(`${BUNDLE}PublishLogOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0002
     * @tc.name      RequestAddForm_PublishLogOf_0002
     * @tc.desc      publishLogOf(succeeded=true, detail="a") returns "RequestPublishForm success : a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_PublishLogOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0002 begin`);
      const actual: string = publishLogOf(true, 'a');
      logInfo(`publishLogOf(succeeded=true, detail="a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : a');
      logInfo(`${BUNDLE}PublishLogOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0003
     * @tc.name      RequestAddForm_PublishLogOf_0003
     * @tc.desc      publishLogOf(succeeded=true, detail="abc") returns "RequestPublishForm success : abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0003 begin`);
      const actual: string = publishLogOf(true, 'abc');
      logInfo(`publishLogOf(succeeded=true, detail="abc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abc');
      logInfo(`${BUNDLE}PublishLogOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0004
     * @tc.name      RequestAddForm_PublishLogOf_0004
     * @tc.desc      publishLogOf(succeeded=true, detail="Hello World") returns "RequestPublishForm success : Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0004 begin`);
      const actual: string = publishLogOf(true, 'Hello World');
      logInfo(`publishLogOf(succeeded=true, detail="Hell...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello World');
      logInfo(`${BUNDLE}PublishLogOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0005
     * @tc.name      RequestAddForm_PublishLogOf_0005
     * @tc.desc      publishLogOf(succeeded=true, detail=" ") returns "RequestPublishForm success :  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0005 begin`);
      const actual: string = publishLogOf(true, ' ');
      logInfo(`publishLogOf(succeeded=true, detail=" "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  ');
      logInfo(`${BUNDLE}PublishLogOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0006
     * @tc.name      RequestAddForm_PublishLogOf_0006
     * @tc.desc      publishLogOf(succeeded=true, detail="123") returns "RequestPublishForm success : 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0006 begin`);
      const actual: string = publishLogOf(true, '123');
      logInfo(`publishLogOf(succeeded=true, detail="123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123');
      logInfo(`${BUNDLE}PublishLogOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0007
     * @tc.name      RequestAddForm_PublishLogOf_0007
     * @tc.desc      publishLogOf(succeeded=true, detail=" a ") returns "RequestPublishForm success :  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0007 begin`);
      const actual: string = publishLogOf(true, ' a ');
      logInfo(`publishLogOf(succeeded=true, detail=" a "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  a ');
      logInfo(`${BUNDLE}PublishLogOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0008
     * @tc.name      RequestAddForm_PublishLogOf_0008
     * @tc.desc      publishLogOf(succeeded=true, detail="aa") returns "RequestPublishForm success : aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0008 begin`);
      const actual: string = publishLogOf(true, 'aa');
      logInfo(`publishLogOf(succeeded=true, detail="aa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : aa');
      logInfo(`${BUNDLE}PublishLogOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0009
     * @tc.name      RequestAddForm_PublishLogOf_0009
     * @tc.desc      publishLogOf(succeeded=true, detail="a_1") returns "RequestPublishForm success : a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0009 begin`);
      const actual: string = publishLogOf(true, 'a_1');
      logInfo(`publishLogOf(succeeded=true, detail="a_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : a_1');
      logInfo(`${BUNDLE}PublishLogOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0010
     * @tc.name      RequestAddForm_PublishLogOf_0010
     * @tc.desc      publishLogOf(succeeded=true, detail="xa") returns "RequestPublishForm success : xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0010 begin`);
      const actual: string = publishLogOf(true, 'xa');
      logInfo(`publishLogOf(succeeded=true, detail="xa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xa');
      logInfo(`${BUNDLE}PublishLogOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0011
     * @tc.name      RequestAddForm_PublishLogOf_0011
     * @tc.desc      publishLogOf(succeeded=true, detail=" abc ") returns "RequestPublishForm success :  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0011 begin`);
      const actual: string = publishLogOf(true, ' abc ');
      logInfo(`publishLogOf(succeeded=true, detail=" abc "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  abc ');
      logInfo(`${BUNDLE}PublishLogOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0012
     * @tc.name      RequestAddForm_PublishLogOf_0012
     * @tc.desc      publishLogOf(succeeded=true, detail="abcabc") returns "RequestPublishForm success : abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0012 begin`);
      const actual: string = publishLogOf(true, 'abcabc');
      logInfo(`publishLogOf(succeeded=true, detail="abca...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abcabc');
      logInfo(`${BUNDLE}PublishLogOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0013
     * @tc.name      RequestAddForm_PublishLogOf_0013
     * @tc.desc      publishLogOf(succeeded=true, detail="abc_1") returns "RequestPublishForm success : abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0013 begin`);
      const actual: string = publishLogOf(true, 'abc_1');
      logInfo(`publishLogOf(succeeded=true, detail="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abc_1');
      logInfo(`${BUNDLE}PublishLogOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0014
     * @tc.name      RequestAddForm_PublishLogOf_0014
     * @tc.desc      publishLogOf(succeeded=true, detail="xabc") returns "RequestPublishForm success : xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0014 begin`);
      const actual: string = publishLogOf(true, 'xabc');
      logInfo(`publishLogOf(succeeded=true, detail="xabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xabc');
      logInfo(`${BUNDLE}PublishLogOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0015
     * @tc.name      RequestAddForm_PublishLogOf_0015
     * @tc.desc      publishLogOf(succeeded=true, detail=" Hello World ") returns "RequestPublishForm success :  Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0015 begin`);
      const actual: string = publishLogOf(true, ' Hello World ');
      logInfo(`publishLogOf(succeeded=true, detail=" Hel...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  Hello World ');
      logInfo(`${BUNDLE}PublishLogOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0016
     * @tc.name      RequestAddForm_PublishLogOf_0016
     * @tc.desc      publishLogOf(succeeded=true, detail="Hello WorldHello World") returns "RequestPublishForm succes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0016 begin`);
      const actual: string = publishLogOf(true, 'Hello WorldHello World');
      logInfo(`publishLogOf(succeeded=true, detail="Hell...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello WorldHello World');
      logInfo(`${BUNDLE}PublishLogOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0017
     * @tc.name      RequestAddForm_PublishLogOf_0017
     * @tc.desc      publishLogOf(succeeded=true, detail="Hello World_1") returns "RequestPublishForm success : Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0017 begin`);
      const actual: string = publishLogOf(true, 'Hello World_1');
      logInfo(`publishLogOf(succeeded=true, detail="Hell...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello World_1');
      logInfo(`${BUNDLE}PublishLogOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0018
     * @tc.name      RequestAddForm_PublishLogOf_0018
     * @tc.desc      publishLogOf(succeeded=true, detail="xHello World") returns "RequestPublishForm success : xHello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0018 begin`);
      const actual: string = publishLogOf(true, 'xHello World');
      logInfo(`publishLogOf(succeeded=true, detail="xHel...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xHello World');
      logInfo(`${BUNDLE}PublishLogOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0019
     * @tc.name      RequestAddForm_PublishLogOf_0019
     * @tc.desc      publishLogOf(succeeded=true, detail="   ") returns "RequestPublishForm success :    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0019 begin`);
      const actual: string = publishLogOf(true, '   ');
      logInfo(`publishLogOf(succeeded=true, detail="   "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :    ');
      logInfo(`${BUNDLE}PublishLogOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0020
     * @tc.name      RequestAddForm_PublishLogOf_0020
     * @tc.desc      publishLogOf(succeeded=true, detail="  ") returns "RequestPublishForm success :   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0020 begin`);
      const actual: string = publishLogOf(true, '  ');
      logInfo(`publishLogOf(succeeded=true, detail="  "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :   ');
      logInfo(`${BUNDLE}PublishLogOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0021
     * @tc.name      RequestAddForm_PublishLogOf_0021
     * @tc.desc      publishLogOf(succeeded=true, detail=" _1") returns "RequestPublishForm success :  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0021 begin`);
      const actual: string = publishLogOf(true, ' _1');
      logInfo(`publishLogOf(succeeded=true, detail=" _1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  _1');
      logInfo(`${BUNDLE}PublishLogOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0022
     * @tc.name      RequestAddForm_PublishLogOf_0022
     * @tc.desc      publishLogOf(succeeded=true, detail="x ") returns "RequestPublishForm success : x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0022 begin`);
      const actual: string = publishLogOf(true, 'x ');
      logInfo(`publishLogOf(succeeded=true, detail="x "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : x ');
      logInfo(`${BUNDLE}PublishLogOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0023
     * @tc.name      RequestAddForm_PublishLogOf_0023
     * @tc.desc      publishLogOf(succeeded=true, detail=" 123 ") returns "RequestPublishForm success :  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0023 begin`);
      const actual: string = publishLogOf(true, ' 123 ');
      logInfo(`publishLogOf(succeeded=true, detail=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  123 ');
      logInfo(`${BUNDLE}PublishLogOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0024
     * @tc.name      RequestAddForm_PublishLogOf_0024
     * @tc.desc      publishLogOf(succeeded=true, detail="123123") returns "RequestPublishForm success : 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0024 begin`);
      const actual: string = publishLogOf(true, '123123');
      logInfo(`publishLogOf(succeeded=true, detail="1231...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123123');
      logInfo(`${BUNDLE}PublishLogOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0025
     * @tc.name      RequestAddForm_PublishLogOf_0025
     * @tc.desc      publishLogOf(succeeded=true, detail="123_1") returns "RequestPublishForm success : 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0025 begin`);
      const actual: string = publishLogOf(true, '123_1');
      logInfo(`publishLogOf(succeeded=true, detail="123_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123_1');
      logInfo(`${BUNDLE}PublishLogOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0026
     * @tc.name      RequestAddForm_PublishLogOf_0026
     * @tc.desc      publishLogOf(succeeded=true, detail="x123") returns "RequestPublishForm success : x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0026 begin`);
      const actual: string = publishLogOf(true, 'x123');
      logInfo(`publishLogOf(succeeded=true, detail="x123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : x123');
      logInfo(`${BUNDLE}PublishLogOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0027
     * @tc.name      RequestAddForm_PublishLogOf_0027
     * @tc.desc      publishLogOf(succeeded=true, detail="jwslS0k") returns "RequestPublishForm success : jwslS0k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0027 begin`);
      const actual: string = publishLogOf(true, 'jwslS0k');
      logInfo(`publishLogOf(succeeded=true, detail="jwsl...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : jwslS0k');
      logInfo(`${BUNDLE}PublishLogOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0028
     * @tc.name      RequestAddForm_PublishLogOf_0028
     * @tc.desc      publishLogOf(succeeded=true, detail="K3TfnKBM3r96") returns "RequestPublishForm success : K3TfnK...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0028 begin`);
      const actual: string = publishLogOf(true, 'K3TfnKBM3r96');
      logInfo(`publishLogOf(succeeded=true, detail="K3Tf...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : K3TfnKBM3r96');
      logInfo(`${BUNDLE}PublishLogOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0029
     * @tc.name      RequestAddForm_PublishLogOf_0029
     * @tc.desc      publishLogOf(succeeded=true, detail="H") returns "RequestPublishForm success : H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0029 begin`);
      const actual: string = publishLogOf(true, 'H');
      logInfo(`publishLogOf(succeeded=true, detail="H"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : H');
      logInfo(`${BUNDLE}PublishLogOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0030
     * @tc.name      RequestAddForm_PublishLogOf_0030
     * @tc.desc      publishLogOf(succeeded=true, detail="0uLnZJjC7l") returns "RequestPublishForm success : 0uLnZJjC7l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0030 begin`);
      const actual: string = publishLogOf(true, '0uLnZJjC7l');
      logInfo(`publishLogOf(succeeded=true, detail="0uLn...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 0uLnZJjC7l');
      logInfo(`${BUNDLE}PublishLogOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0031
     * @tc.name      RequestAddForm_PublishLogOf_0031
     * @tc.desc      publishLogOf(succeeded=true, detail="ZyDwLML2pP") returns "RequestPublishForm success : ZyDwLML2pP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0031 begin`);
      const actual: string = publishLogOf(true, 'ZyDwLML2pP');
      logInfo(`publishLogOf(succeeded=true, detail="ZyDw...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ZyDwLML2pP');
      logInfo(`${BUNDLE}PublishLogOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0032
     * @tc.name      RequestAddForm_PublishLogOf_0032
     * @tc.desc      publishLogOf(succeeded=true, detail="VXdLbB2ZY") returns "RequestPublishForm success : VXdLbB2ZY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0032 begin`);
      const actual: string = publishLogOf(true, 'VXdLbB2ZY');
      logInfo(`publishLogOf(succeeded=true, detail="VXdL...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : VXdLbB2ZY');
      logInfo(`${BUNDLE}PublishLogOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0033
     * @tc.name      RequestAddForm_PublishLogOf_0033
     * @tc.desc      publishLogOf(succeeded=true, detail="qeLE6iwbO") returns "RequestPublishForm success : qeLE6iwbO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0033 begin`);
      const actual: string = publishLogOf(true, 'qeLE6iwbO');
      logInfo(`publishLogOf(succeeded=true, detail="qeLE...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : qeLE6iwbO');
      logInfo(`${BUNDLE}PublishLogOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0034
     * @tc.name      RequestAddForm_PublishLogOf_0034
     * @tc.desc      publishLogOf(succeeded=true, detail="4HzM") returns "RequestPublishForm success : 4HzM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0034 begin`);
      const actual: string = publishLogOf(true, '4HzM');
      logInfo(`publishLogOf(succeeded=true, detail="4HzM"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 4HzM');
      logInfo(`${BUNDLE}PublishLogOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0035
     * @tc.name      RequestAddForm_PublishLogOf_0035
     * @tc.desc      publishLogOf(succeeded=true, detail="YmO") returns "RequestPublishForm success : YmO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0035 begin`);
      const actual: string = publishLogOf(true, 'YmO');
      logInfo(`publishLogOf(succeeded=true, detail="YmO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : YmO');
      logInfo(`${BUNDLE}PublishLogOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0036
     * @tc.name      RequestAddForm_PublishLogOf_0036
     * @tc.desc      publishLogOf(succeeded=true, detail="JQIi8XF7yB") returns "RequestPublishForm success : JQIi8XF7yB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0036 begin`);
      const actual: string = publishLogOf(true, 'JQIi8XF7yB');
      logInfo(`publishLogOf(succeeded=true, detail="JQIi...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : JQIi8XF7yB');
      logInfo(`${BUNDLE}PublishLogOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0037
     * @tc.name      RequestAddForm_PublishLogOf_0037
     * @tc.desc      publishLogOf(succeeded=true, detail="i6XL0") returns "RequestPublishForm success : i6XL0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0037 begin`);
      const actual: string = publishLogOf(true, 'i6XL0');
      logInfo(`publishLogOf(succeeded=true, detail="i6XL0"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : i6XL0');
      logInfo(`${BUNDLE}PublishLogOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0038
     * @tc.name      RequestAddForm_PublishLogOf_0038
     * @tc.desc      publishLogOf(succeeded=true, detail="5ybFDIm03P") returns "RequestPublishForm success : 5ybFDIm03P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0038 begin`);
      const actual: string = publishLogOf(true, '5ybFDIm03P');
      logInfo(`publishLogOf(succeeded=true, detail="5ybF...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 5ybFDIm03P');
      logInfo(`${BUNDLE}PublishLogOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0039
     * @tc.name      RequestAddForm_PublishLogOf_0039
     * @tc.desc      publishLogOf(succeeded=true, detail="kzp1") returns "RequestPublishForm success : kzp1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0039 begin`);
      const actual: string = publishLogOf(true, 'kzp1');
      logInfo(`publishLogOf(succeeded=true, detail="kzp1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : kzp1');
      logInfo(`${BUNDLE}PublishLogOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0040
     * @tc.name      RequestAddForm_PublishLogOf_0040
     * @tc.desc      publishLogOf(succeeded=true, detail="i") returns "RequestPublishForm success : i"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0040 begin`);
      const actual: string = publishLogOf(true, 'i');
      logInfo(`publishLogOf(succeeded=true, detail="i"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : i');
      logInfo(`${BUNDLE}PublishLogOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0041
     * @tc.name      RequestAddForm_PublishLogOf_0041
     * @tc.desc      publishLogOf(succeeded=true, detail="u") returns "RequestPublishForm success : u"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0041 begin`);
      const actual: string = publishLogOf(true, 'u');
      logInfo(`publishLogOf(succeeded=true, detail="u"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : u');
      logInfo(`${BUNDLE}PublishLogOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0042
     * @tc.name      RequestAddForm_PublishLogOf_0042
     * @tc.desc      publishLogOf(succeeded=true, detail="c5g") returns "RequestPublishForm success : c5g"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0042 begin`);
      const actual: string = publishLogOf(true, 'c5g');
      logInfo(`publishLogOf(succeeded=true, detail="c5g"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : c5g');
      logInfo(`${BUNDLE}PublishLogOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0043
     * @tc.name      RequestAddForm_PublishLogOf_0043
     * @tc.desc      publishLogOf(succeeded=true, detail="4xs7ikR3") returns "RequestPublishForm success : 4xs7ikR3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0043 begin`);
      const actual: string = publishLogOf(true, '4xs7ikR3');
      logInfo(`publishLogOf(succeeded=true, detail="4xs7...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 4xs7ikR3');
      logInfo(`${BUNDLE}PublishLogOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0044
     * @tc.name      RequestAddForm_PublishLogOf_0044
     * @tc.desc      publishLogOf(succeeded=true, detail="3DTsxDrrBna") returns "RequestPublishForm success : 3DTsxDr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0044 begin`);
      const actual: string = publishLogOf(true, '3DTsxDrrBna');
      logInfo(`publishLogOf(succeeded=true, detail="3DTs...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 3DTsxDrrBna');
      logInfo(`${BUNDLE}PublishLogOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0045
     * @tc.name      RequestAddForm_PublishLogOf_0045
     * @tc.desc      publishLogOf(succeeded=true, detail="rQoI1W4XHmC") returns "RequestPublishForm success : rQoI1W4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0045 begin`);
      const actual: string = publishLogOf(true, 'rQoI1W4XHmC');
      logInfo(`publishLogOf(succeeded=true, detail="rQoI...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : rQoI1W4XHmC');
      logInfo(`${BUNDLE}PublishLogOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0046
     * @tc.name      RequestAddForm_PublishLogOf_0046
     * @tc.desc      publishLogOf(succeeded=true, detail="0r") returns "RequestPublishForm success : 0r"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0046 begin`);
      const actual: string = publishLogOf(true, '0r');
      logInfo(`publishLogOf(succeeded=true, detail="0r"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 0r');
      logInfo(`${BUNDLE}PublishLogOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0047
     * @tc.name      RequestAddForm_PublishLogOf_0047
     * @tc.desc      publishLogOf(succeeded=true, detail="kda3c4osqc6") returns "RequestPublishForm success : kda3c4o...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0047 begin`);
      const actual: string = publishLogOf(true, 'kda3c4osqc6');
      logInfo(`publishLogOf(succeeded=true, detail="kda3...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : kda3c4osqc6');
      logInfo(`${BUNDLE}PublishLogOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0048
     * @tc.name      RequestAddForm_PublishLogOf_0048
     * @tc.desc      publishLogOf(succeeded=true, detail="1Yk1") returns "RequestPublishForm success : 1Yk1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0048 begin`);
      const actual: string = publishLogOf(true, '1Yk1');
      logInfo(`publishLogOf(succeeded=true, detail="1Yk1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 1Yk1');
      logInfo(`${BUNDLE}PublishLogOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0049
     * @tc.name      RequestAddForm_PublishLogOf_0049
     * @tc.desc      publishLogOf(succeeded=false, detail="") returns "RequestPublishForm failed : "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0049 begin`);
      const actual: string = publishLogOf(false, '');
      logInfo(`publishLogOf(succeeded=false, detail=""): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ');
      logInfo(`${BUNDLE}PublishLogOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0050
     * @tc.name      RequestAddForm_PublishLogOf_0050
     * @tc.desc      publishLogOf(succeeded=false, detail="a") returns "RequestPublishForm failed : a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0050 begin`);
      const actual: string = publishLogOf(false, 'a');
      logInfo(`publishLogOf(succeeded=false, detail="a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : a');
      logInfo(`${BUNDLE}PublishLogOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0051
     * @tc.name      RequestAddForm_PublishLogOf_0051
     * @tc.desc      publishLogOf(succeeded=false, detail="abc") returns "RequestPublishForm failed : abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0051 begin`);
      const actual: string = publishLogOf(false, 'abc');
      logInfo(`publishLogOf(succeeded=false, detail="abc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abc');
      logInfo(`${BUNDLE}PublishLogOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0052
     * @tc.name      RequestAddForm_PublishLogOf_0052
     * @tc.desc      publishLogOf(succeeded=false, detail="Hello World") returns "RequestPublishForm failed : Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0052 begin`);
      const actual: string = publishLogOf(false, 'Hello World');
      logInfo(`publishLogOf(succeeded=false, detail="Hel...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello World');
      logInfo(`${BUNDLE}PublishLogOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0053
     * @tc.name      RequestAddForm_PublishLogOf_0053
     * @tc.desc      publishLogOf(succeeded=false, detail=" ") returns "RequestPublishForm failed :  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0053 begin`);
      const actual: string = publishLogOf(false, ' ');
      logInfo(`publishLogOf(succeeded=false, detail=" "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  ');
      logInfo(`${BUNDLE}PublishLogOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0054
     * @tc.name      RequestAddForm_PublishLogOf_0054
     * @tc.desc      publishLogOf(succeeded=false, detail="123") returns "RequestPublishForm failed : 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0054 begin`);
      const actual: string = publishLogOf(false, '123');
      logInfo(`publishLogOf(succeeded=false, detail="123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123');
      logInfo(`${BUNDLE}PublishLogOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0055
     * @tc.name      RequestAddForm_PublishLogOf_0055
     * @tc.desc      publishLogOf(succeeded=false, detail=" a ") returns "RequestPublishForm failed :  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0055 begin`);
      const actual: string = publishLogOf(false, ' a ');
      logInfo(`publishLogOf(succeeded=false, detail=" a "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  a ');
      logInfo(`${BUNDLE}PublishLogOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0056
     * @tc.name      RequestAddForm_PublishLogOf_0056
     * @tc.desc      publishLogOf(succeeded=false, detail="aa") returns "RequestPublishForm failed : aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0056 begin`);
      const actual: string = publishLogOf(false, 'aa');
      logInfo(`publishLogOf(succeeded=false, detail="aa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : aa');
      logInfo(`${BUNDLE}PublishLogOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0057
     * @tc.name      RequestAddForm_PublishLogOf_0057
     * @tc.desc      publishLogOf(succeeded=false, detail="a_1") returns "RequestPublishForm failed : a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0057 begin`);
      const actual: string = publishLogOf(false, 'a_1');
      logInfo(`publishLogOf(succeeded=false, detail="a_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : a_1');
      logInfo(`${BUNDLE}PublishLogOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0058
     * @tc.name      RequestAddForm_PublishLogOf_0058
     * @tc.desc      publishLogOf(succeeded=false, detail="xa") returns "RequestPublishForm failed : xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0058 begin`);
      const actual: string = publishLogOf(false, 'xa');
      logInfo(`publishLogOf(succeeded=false, detail="xa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xa');
      logInfo(`${BUNDLE}PublishLogOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0059
     * @tc.name      RequestAddForm_PublishLogOf_0059
     * @tc.desc      publishLogOf(succeeded=false, detail=" abc ") returns "RequestPublishForm failed :  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0059 begin`);
      const actual: string = publishLogOf(false, ' abc ');
      logInfo(`publishLogOf(succeeded=false, detail=" ab...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  abc ');
      logInfo(`${BUNDLE}PublishLogOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0060
     * @tc.name      RequestAddForm_PublishLogOf_0060
     * @tc.desc      publishLogOf(succeeded=false, detail="abcabc") returns "RequestPublishForm failed : abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0060 begin`);
      const actual: string = publishLogOf(false, 'abcabc');
      logInfo(`publishLogOf(succeeded=false, detail="abc...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abcabc');
      logInfo(`${BUNDLE}PublishLogOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0061
     * @tc.name      RequestAddForm_PublishLogOf_0061
     * @tc.desc      publishLogOf(succeeded=false, detail="abc_1") returns "RequestPublishForm failed : abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0061 begin`);
      const actual: string = publishLogOf(false, 'abc_1');
      logInfo(`publishLogOf(succeeded=false, detail="abc...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abc_1');
      logInfo(`${BUNDLE}PublishLogOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0062
     * @tc.name      RequestAddForm_PublishLogOf_0062
     * @tc.desc      publishLogOf(succeeded=false, detail="xabc") returns "RequestPublishForm failed : xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0062 begin`);
      const actual: string = publishLogOf(false, 'xabc');
      logInfo(`publishLogOf(succeeded=false, detail="xabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`${BUNDLE}PublishLogOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0063
     * @tc.name      RequestAddForm_PublishLogOf_0063
     * @tc.desc      publishLogOf(succeeded=false, detail=" Hello World ") returns "RequestPublishForm failed :  Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0063 begin`);
      const actual: string = publishLogOf(false, ' Hello World ');
      logInfo(`publishLogOf(succeeded=false, detail=" He...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  Hello World ');
      logInfo(`${BUNDLE}PublishLogOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0064
     * @tc.name      RequestAddForm_PublishLogOf_0064
     * @tc.desc      publishLogOf(succeeded=false, detail="Hello WorldHello World") returns "RequestPublishForm faile...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0064 begin`);
      const actual: string = publishLogOf(false, 'Hello WorldHello World');
      logInfo(`publishLogOf(succeeded=false, detail="Hel...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello WorldHello World');
      logInfo(`${BUNDLE}PublishLogOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0065
     * @tc.name      RequestAddForm_PublishLogOf_0065
     * @tc.desc      publishLogOf(succeeded=false, detail="Hello World_1") returns "RequestPublishForm failed : Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0065 begin`);
      const actual: string = publishLogOf(false, 'Hello World_1');
      logInfo(`publishLogOf(succeeded=false, detail="Hel...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello World_1');
      logInfo(`${BUNDLE}PublishLogOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0066
     * @tc.name      RequestAddForm_PublishLogOf_0066
     * @tc.desc      publishLogOf(succeeded=false, detail="xHello World") returns "RequestPublishForm failed : xHello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0066 begin`);
      const actual: string = publishLogOf(false, 'xHello World');
      logInfo(`publishLogOf(succeeded=false, detail="xHe...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xHello World');
      logInfo(`${BUNDLE}PublishLogOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0067
     * @tc.name      RequestAddForm_PublishLogOf_0067
     * @tc.desc      publishLogOf(succeeded=false, detail="   ") returns "RequestPublishForm failed :    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0067 begin`);
      const actual: string = publishLogOf(false, '   ');
      logInfo(`publishLogOf(succeeded=false, detail="   "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :    ');
      logInfo(`${BUNDLE}PublishLogOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0068
     * @tc.name      RequestAddForm_PublishLogOf_0068
     * @tc.desc      publishLogOf(succeeded=false, detail="  ") returns "RequestPublishForm failed :   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0068 begin`);
      const actual: string = publishLogOf(false, '  ');
      logInfo(`publishLogOf(succeeded=false, detail="  "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :   ');
      logInfo(`${BUNDLE}PublishLogOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0069
     * @tc.name      RequestAddForm_PublishLogOf_0069
     * @tc.desc      publishLogOf(succeeded=false, detail=" _1") returns "RequestPublishForm failed :  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0069 begin`);
      const actual: string = publishLogOf(false, ' _1');
      logInfo(`publishLogOf(succeeded=false, detail=" _1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  _1');
      logInfo(`${BUNDLE}PublishLogOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0070
     * @tc.name      RequestAddForm_PublishLogOf_0070
     * @tc.desc      publishLogOf(succeeded=false, detail="x ") returns "RequestPublishForm failed : x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0070 begin`);
      const actual: string = publishLogOf(false, 'x ');
      logInfo(`publishLogOf(succeeded=false, detail="x "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : x ');
      logInfo(`${BUNDLE}PublishLogOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0071
     * @tc.name      RequestAddForm_PublishLogOf_0071
     * @tc.desc      publishLogOf(succeeded=false, detail=" 123 ") returns "RequestPublishForm failed :  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0071 begin`);
      const actual: string = publishLogOf(false, ' 123 ');
      logInfo(`publishLogOf(succeeded=false, detail=" 12...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  123 ');
      logInfo(`${BUNDLE}PublishLogOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0072
     * @tc.name      RequestAddForm_PublishLogOf_0072
     * @tc.desc      publishLogOf(succeeded=false, detail="123123") returns "RequestPublishForm failed : 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0072 begin`);
      const actual: string = publishLogOf(false, '123123');
      logInfo(`publishLogOf(succeeded=false, detail="123...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123123');
      logInfo(`${BUNDLE}PublishLogOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0073
     * @tc.name      RequestAddForm_PublishLogOf_0073
     * @tc.desc      publishLogOf(succeeded=false, detail="123_1") returns "RequestPublishForm failed : 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0073 begin`);
      const actual: string = publishLogOf(false, '123_1');
      logInfo(`publishLogOf(succeeded=false, detail="123...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`${BUNDLE}PublishLogOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0074
     * @tc.name      RequestAddForm_PublishLogOf_0074
     * @tc.desc      publishLogOf(succeeded=false, detail="x123") returns "RequestPublishForm failed : x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_PublishLogOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0074 begin`);
      const actual: string = publishLogOf(false, 'x123');
      logInfo(`publishLogOf(succeeded=false, detail="x123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : x123');
      logInfo(`${BUNDLE}PublishLogOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0075
     * @tc.name      RequestAddForm_PublishLogOf_0075
     * @tc.desc      publishLogOf(succeeded=false, detail="jwslS0k") returns "RequestPublishForm failed : jwslS0k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0075 begin`);
      const actual: string = publishLogOf(false, 'jwslS0k');
      logInfo(`publishLogOf(succeeded=false, detail="jws...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : jwslS0k');
      logInfo(`${BUNDLE}PublishLogOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0076
     * @tc.name      RequestAddForm_PublishLogOf_0076
     * @tc.desc      publishLogOf(succeeded=false, detail="K3TfnKBM3r96") returns "RequestPublishForm failed : K3TfnK...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0076 begin`);
      const actual: string = publishLogOf(false, 'K3TfnKBM3r96');
      logInfo(`publishLogOf(succeeded=false, detail="K3T...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : K3TfnKBM3r96');
      logInfo(`${BUNDLE}PublishLogOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0077
     * @tc.name      RequestAddForm_PublishLogOf_0077
     * @tc.desc      publishLogOf(succeeded=false, detail="H") returns "RequestPublishForm failed : H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0077 begin`);
      const actual: string = publishLogOf(false, 'H');
      logInfo(`publishLogOf(succeeded=false, detail="H"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : H');
      logInfo(`${BUNDLE}PublishLogOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0078
     * @tc.name      RequestAddForm_PublishLogOf_0078
     * @tc.desc      publishLogOf(succeeded=false, detail="0uLnZJjC7l") returns "RequestPublishForm failed : 0uLnZJjC7l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0078 begin`);
      const actual: string = publishLogOf(false, '0uLnZJjC7l');
      logInfo(`publishLogOf(succeeded=false, detail="0uL...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 0uLnZJjC7l');
      logInfo(`${BUNDLE}PublishLogOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0079
     * @tc.name      RequestAddForm_PublishLogOf_0079
     * @tc.desc      publishLogOf(succeeded=false, detail="ZyDwLML2pP") returns "RequestPublishForm failed : ZyDwLML2pP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0079 begin`);
      const actual: string = publishLogOf(false, 'ZyDwLML2pP');
      logInfo(`publishLogOf(succeeded=false, detail="ZyD...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ZyDwLML2pP');
      logInfo(`${BUNDLE}PublishLogOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0080
     * @tc.name      RequestAddForm_PublishLogOf_0080
     * @tc.desc      publishLogOf(succeeded=false, detail="VXdLbB2ZY") returns "RequestPublishForm failed : VXdLbB2ZY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0080 begin`);
      const actual: string = publishLogOf(false, 'VXdLbB2ZY');
      logInfo(`publishLogOf(succeeded=false, detail="VXd...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : VXdLbB2ZY');
      logInfo(`${BUNDLE}PublishLogOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0081
     * @tc.name      RequestAddForm_PublishLogOf_0081
     * @tc.desc      publishLogOf(succeeded=false, detail="qeLE6iwbO") returns "RequestPublishForm failed : qeLE6iwbO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0081 begin`);
      const actual: string = publishLogOf(false, 'qeLE6iwbO');
      logInfo(`publishLogOf(succeeded=false, detail="qeL...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : qeLE6iwbO');
      logInfo(`${BUNDLE}PublishLogOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0082
     * @tc.name      RequestAddForm_PublishLogOf_0082
     * @tc.desc      publishLogOf(succeeded=false, detail="4HzM") returns "RequestPublishForm failed : 4HzM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0082 begin`);
      const actual: string = publishLogOf(false, '4HzM');
      logInfo(`publishLogOf(succeeded=false, detail="4HzM"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4HzM');
      logInfo(`${BUNDLE}PublishLogOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0083
     * @tc.name      RequestAddForm_PublishLogOf_0083
     * @tc.desc      publishLogOf(succeeded=false, detail="YmO") returns "RequestPublishForm failed : YmO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0083 begin`);
      const actual: string = publishLogOf(false, 'YmO');
      logInfo(`publishLogOf(succeeded=false, detail="YmO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : YmO');
      logInfo(`${BUNDLE}PublishLogOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0084
     * @tc.name      RequestAddForm_PublishLogOf_0084
     * @tc.desc      publishLogOf(succeeded=false, detail="JQIi8XF7yB") returns "RequestPublishForm failed : JQIi8XF7yB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0084 begin`);
      const actual: string = publishLogOf(false, 'JQIi8XF7yB');
      logInfo(`publishLogOf(succeeded=false, detail="JQI...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : JQIi8XF7yB');
      logInfo(`${BUNDLE}PublishLogOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0085
     * @tc.name      RequestAddForm_PublishLogOf_0085
     * @tc.desc      publishLogOf(succeeded=false, detail="i6XL0") returns "RequestPublishForm failed : i6XL0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0085 begin`);
      const actual: string = publishLogOf(false, 'i6XL0');
      logInfo(`publishLogOf(succeeded=false, detail="i6X...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : i6XL0');
      logInfo(`${BUNDLE}PublishLogOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0086
     * @tc.name      RequestAddForm_PublishLogOf_0086
     * @tc.desc      publishLogOf(succeeded=false, detail="5ybFDIm03P") returns "RequestPublishForm failed : 5ybFDIm03P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0086 begin`);
      const actual: string = publishLogOf(false, '5ybFDIm03P');
      logInfo(`publishLogOf(succeeded=false, detail="5yb...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 5ybFDIm03P');
      logInfo(`${BUNDLE}PublishLogOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0087
     * @tc.name      RequestAddForm_PublishLogOf_0087
     * @tc.desc      publishLogOf(succeeded=false, detail="kzp1") returns "RequestPublishForm failed : kzp1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0087 begin`);
      const actual: string = publishLogOf(false, 'kzp1');
      logInfo(`publishLogOf(succeeded=false, detail="kzp1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : kzp1');
      logInfo(`${BUNDLE}PublishLogOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0088
     * @tc.name      RequestAddForm_PublishLogOf_0088
     * @tc.desc      publishLogOf(succeeded=false, detail="i") returns "RequestPublishForm failed : i"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0088 begin`);
      const actual: string = publishLogOf(false, 'i');
      logInfo(`publishLogOf(succeeded=false, detail="i"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : i');
      logInfo(`${BUNDLE}PublishLogOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0089
     * @tc.name      RequestAddForm_PublishLogOf_0089
     * @tc.desc      publishLogOf(succeeded=false, detail="u") returns "RequestPublishForm failed : u"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0089 begin`);
      const actual: string = publishLogOf(false, 'u');
      logInfo(`publishLogOf(succeeded=false, detail="u"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : u');
      logInfo(`${BUNDLE}PublishLogOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0090
     * @tc.name      RequestAddForm_PublishLogOf_0090
     * @tc.desc      publishLogOf(succeeded=false, detail="c5g") returns "RequestPublishForm failed : c5g"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0090 begin`);
      const actual: string = publishLogOf(false, 'c5g');
      logInfo(`publishLogOf(succeeded=false, detail="c5g"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : c5g');
      logInfo(`${BUNDLE}PublishLogOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0091
     * @tc.name      RequestAddForm_PublishLogOf_0091
     * @tc.desc      publishLogOf(succeeded=false, detail="4xs7ikR3") returns "RequestPublishForm failed : 4xs7ikR3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0091 begin`);
      const actual: string = publishLogOf(false, '4xs7ikR3');
      logInfo(`publishLogOf(succeeded=false, detail="4xs...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4xs7ikR3');
      logInfo(`${BUNDLE}PublishLogOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0092
     * @tc.name      RequestAddForm_PublishLogOf_0092
     * @tc.desc      publishLogOf(succeeded=false, detail="3DTsxDrrBna") returns "RequestPublishForm failed : 3DTsxDr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0092 begin`);
      const actual: string = publishLogOf(false, '3DTsxDrrBna');
      logInfo(`publishLogOf(succeeded=false, detail="3DT...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 3DTsxDrrBna');
      logInfo(`${BUNDLE}PublishLogOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0093
     * @tc.name      RequestAddForm_PublishLogOf_0093
     * @tc.desc      publishLogOf(succeeded=false, detail="rQoI1W4XHmC") returns "RequestPublishForm failed : rQoI1W4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0093 begin`);
      const actual: string = publishLogOf(false, 'rQoI1W4XHmC');
      logInfo(`publishLogOf(succeeded=false, detail="rQo...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : rQoI1W4XHmC');
      logInfo(`${BUNDLE}PublishLogOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0094
     * @tc.name      RequestAddForm_PublishLogOf_0094
     * @tc.desc      publishLogOf(succeeded=false, detail="0r") returns "RequestPublishForm failed : 0r"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0094 begin`);
      const actual: string = publishLogOf(false, '0r');
      logInfo(`publishLogOf(succeeded=false, detail="0r"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 0r');
      logInfo(`${BUNDLE}PublishLogOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0095
     * @tc.name      RequestAddForm_PublishLogOf_0095
     * @tc.desc      publishLogOf(succeeded=false, detail="kda3c4osqc6") returns "RequestPublishForm failed : kda3c4o...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0095 begin`);
      const actual: string = publishLogOf(false, 'kda3c4osqc6');
      logInfo(`publishLogOf(succeeded=false, detail="kda...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : kda3c4osqc6');
      logInfo(`${BUNDLE}PublishLogOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_LOG_OF_0096
     * @tc.name      RequestAddForm_PublishLogOf_0096
     * @tc.desc      publishLogOf(succeeded=false, detail="1Yk1") returns "RequestPublishForm failed : 1Yk1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_PublishLogOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PublishLogOf_0096 begin`);
      const actual: string = publishLogOf(false, '1Yk1');
      logInfo(`publishLogOf(succeeded=false, detail="1Yk1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 1Yk1');
      logInfo(`${BUNDLE}PublishLogOf_0096 end`);
    });
  });
}
