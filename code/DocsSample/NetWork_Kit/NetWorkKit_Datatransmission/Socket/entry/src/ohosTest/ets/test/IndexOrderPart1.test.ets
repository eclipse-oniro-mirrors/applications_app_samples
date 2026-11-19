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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ensureIndex, textTop } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function IndexOrderPart1Test(): void {
  describe('IndexOrderPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0100
     * @tc.name      testIndexOrder0001
     * @tc.desc      Verify Index entry Tcp服务端 is laid out below Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0001 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('Tcp客户端');
      const lower: number = await textTop('Tcp服务端');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0200
     * @tc.name      testIndexOrder0002
     * @tc.desc      Verify Index entry Udp客户端&服务端 is laid out below Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0002 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('Tcp服务端');
      const lower: number = await textTop('Udp客户端&服务端');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0300
     * @tc.name      testIndexOrder0003
     * @tc.desc      Verify Index entry 多播通信 is laid out below Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0003 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('Udp客户端&服务端');
      const lower: number = await textTop('多播通信');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0400
     * @tc.name      testIndexOrder0004
     * @tc.desc      Verify Index entry LocalSocket 数据传输 is laid out below 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0004 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('多播通信');
      const lower: number = await textTop('LocalSocket 数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0500
     * @tc.name      testIndexOrder0005
     * @tc.desc      Verify Index entry 单向TLS Socket 加密数据传输 is laid out below LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0005 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('LocalSocket 数据传输');
      const lower: number = await textTop('单向TLS Socket 加密数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0600
     * @tc.name      testIndexOrder0006
     * @tc.desc      Verify Index entry 双向TLS Socket 加密数据传输 is laid out below 单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0006 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('单向TLS Socket 加密数据传输');
      const lower: number = await textTop('双向TLS Socket 加密数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0700
     * @tc.name      testIndexOrder0007
     * @tc.desc      Verify Index entry TCP Socket 升级为单向TLS Socket 加密数据传输 is laid out below 双向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0007 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('双向TLS Socket 加密数据传输');
      const lower: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0800
     * @tc.name      testIndexOrder0008
     * @tc.desc      Verify Index entry TCP Socket 升级为双向TLS Socket加密数据传输 is laid out below TCP Socket 升级为单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0008 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      const lower: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDERP1_0900
     * @tc.name      testIndexOrder0009
     * @tc.desc      Verify Index entry TLS Socket Server 加密数据传输 is laid out below TCP Socket 升级为双向TLS Socket加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexOrder0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0009 begin');
      expect(await ensureIndex()).assertTrue();
      const upper: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      const lower: number = await textTop('TLS Socket Server 加密数据传输');
      expect(upper >= 0).assertTrue();
      expect(lower >= 0).assertTrue();
      expect(lower > upper).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexOrder0009 end');
    })

  })
}
