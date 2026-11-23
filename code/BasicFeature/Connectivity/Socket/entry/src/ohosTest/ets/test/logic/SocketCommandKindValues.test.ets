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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SocketCommandKind } from '../SocketCommandParser';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';
const BUNDLE: string = 'Socket_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SocketCommandKind (5 cases). */
export default function socketCommandKindValuesTest(): void {
  describe('SocketCommandKindValuesTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_SOCKET_COMMAND_KIND_VALUES_0001
     * @tc.name      Socket_SocketCommandKindValues_0001
     * @tc.desc      SocketCommandKind.ONLINE keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_SocketCommandKindValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SocketCommandKindValues_0001 begin`);
      const actual: number = SocketCommandKind.ONLINE;
      logInfo(`SocketCommandKind.ONLINE: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SocketCommandKindValues_0001 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_SOCKET_COMMAND_KIND_VALUES_0002
     * @tc.name      Socket_SocketCommandKindValues_0002
     * @tc.desc      SocketCommandKind.OFFLINE keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_SocketCommandKindValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SocketCommandKindValues_0002 begin`);
      const actual: number = SocketCommandKind.OFFLINE;
      logInfo(`SocketCommandKind.OFFLINE: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SocketCommandKindValues_0002 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_SOCKET_COMMAND_KIND_VALUES_0003
     * @tc.name      Socket_SocketCommandKindValues_0003
     * @tc.desc      SocketCommandKind.EXIT keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_SocketCommandKindValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SocketCommandKindValues_0003 begin`);
      const actual: number = SocketCommandKind.EXIT;
      logInfo(`SocketCommandKind.EXIT: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SocketCommandKindValues_0003 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_SOCKET_COMMAND_KIND_VALUES_0004
     * @tc.name      Socket_SocketCommandKindValues_0004
     * @tc.desc      SocketCommandKind.CHAT keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_SocketCommandKindValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SocketCommandKindValues_0004 begin`);
      const actual: number = SocketCommandKind.CHAT;
      logInfo(`SocketCommandKind.CHAT: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SocketCommandKindValues_0004 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_SOCKET_COMMAND_KIND_VALUES_0005
     * @tc.name      Socket_SocketCommandKindValues_0005
     * @tc.desc      SocketCommandKind.UNKNOWN keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_SocketCommandKindValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SocketCommandKindValues_0005 begin`);
      const actual: number = SocketCommandKind.UNKNOWN;
      logInfo(`SocketCommandKind.UNKNOWN: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SocketCommandKindValues_0005 end`);
    });
  });
}
