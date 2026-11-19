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
import { ensureIndex, textTop } from './shared/SocketUiSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function IndexPairOrderMatrixPart1Test(): void {
  describe('IndexPairOrderMatrixPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0100
     * @tc.name      testIndexPairOrder0001
     * @tc.desc      Verify entry Udp客户端&服务端 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0001 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('Udp客户端&服务端');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0200
     * @tc.name      testIndexPairOrder0002
     * @tc.desc      Verify entry 多播通信 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0002 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('多播通信');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0300
     * @tc.name      testIndexPairOrder0003
     * @tc.desc      Verify entry LocalSocket 数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0003 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('LocalSocket 数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0400
     * @tc.name      testIndexPairOrder0004
     * @tc.desc      Verify entry 单向TLS Socket 加密数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0004 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0500
     * @tc.name      testIndexPairOrder0005
     * @tc.desc      Verify entry 双向TLS Socket 加密数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0005 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('双向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0600
     * @tc.name      testIndexPairOrder0006
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0006 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0700
     * @tc.name      testIndexPairOrder0007
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0007 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0800
     * @tc.name      testIndexPairOrder0008
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry Tcp客户端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0008 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp客户端');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_0900
     * @tc.name      testIndexPairOrder0009
     * @tc.desc      Verify entry 多播通信 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0009 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('多播通信');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1000
     * @tc.name      testIndexPairOrder0010
     * @tc.desc      Verify entry LocalSocket 数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0010 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('LocalSocket 数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1100
     * @tc.name      testIndexPairOrder0011
     * @tc.desc      Verify entry 单向TLS Socket 加密数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0011 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1200
     * @tc.name      testIndexPairOrder0012
     * @tc.desc      Verify entry 双向TLS Socket 加密数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0012 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('双向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1300
     * @tc.name      testIndexPairOrder0013
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0013 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1400
     * @tc.name      testIndexPairOrder0014
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0014 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1500
     * @tc.name      testIndexPairOrder0015
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry Tcp服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0015 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Tcp服务端');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1600
     * @tc.name      testIndexPairOrder0016
     * @tc.desc      Verify entry LocalSocket 数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0016 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('LocalSocket 数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1700
     * @tc.name      testIndexPairOrder0017
     * @tc.desc      Verify entry 单向TLS Socket 加密数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0017 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1800
     * @tc.name      testIndexPairOrder0018
     * @tc.desc      Verify entry 双向TLS Socket 加密数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0018 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('双向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_1900
     * @tc.name      testIndexPairOrder0019
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0019 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2000
     * @tc.name      testIndexPairOrder0020
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0020 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2100
     * @tc.name      testIndexPairOrder0021
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry Udp客户端&服务端.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0021 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('Udp客户端&服务端');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2200
     * @tc.name      testIndexPairOrder0022
     * @tc.desc      Verify entry 单向TLS Socket 加密数据传输 is below entry 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0022 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('多播通信');
      const second: number = await textTop('单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2300
     * @tc.name      testIndexPairOrder0023
     * @tc.desc      Verify entry 双向TLS Socket 加密数据传输 is below entry 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0023 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('多播通信');
      const second: number = await textTop('双向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2400
     * @tc.name      testIndexPairOrder0024
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0024 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('多播通信');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2500
     * @tc.name      testIndexPairOrder0025
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0025 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('多播通信');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2600
     * @tc.name      testIndexPairOrder0026
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry 多播通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0026 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('多播通信');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0026 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2700
     * @tc.name      testIndexPairOrder0027
     * @tc.desc      Verify entry 双向TLS Socket 加密数据传输 is below entry LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0027 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('LocalSocket 数据传输');
      const second: number = await textTop('双向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0027 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2800
     * @tc.name      testIndexPairOrder0028
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0028 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('LocalSocket 数据传输');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0028 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_2900
     * @tc.name      testIndexPairOrder0029
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0029 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('LocalSocket 数据传输');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0029 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3000
     * @tc.name      testIndexPairOrder0030
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry LocalSocket 数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0030 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('LocalSocket 数据传输');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0030 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3100
     * @tc.name      testIndexPairOrder0031
     * @tc.desc      Verify entry TCP Socket 升级为单向TLS Socket 加密数据传输 is below entry 单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0031 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('单向TLS Socket 加密数据传输');
      const second: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0031 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3200
     * @tc.name      testIndexPairOrder0032
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry 单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0032 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('单向TLS Socket 加密数据传输');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0032 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3300
     * @tc.name      testIndexPairOrder0033
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry 单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0033 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('单向TLS Socket 加密数据传输');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0033 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3400
     * @tc.name      testIndexPairOrder0034
     * @tc.desc      Verify entry TCP Socket 升级为双向TLS Socket加密数据传输 is below entry 双向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0034 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('双向TLS Socket 加密数据传输');
      const second: number = await textTop('TCP Socket 升级为双向TLS Socket加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0034 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3500
     * @tc.name      testIndexPairOrder0035
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry 双向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0035 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('双向TLS Socket 加密数据传输');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0035 end');
    })

    /**
     * @tc.number    SUB_SOCKET_ORDP1_3600
     * @tc.name      testIndexPairOrder0036
     * @tc.desc      Verify entry TLS Socket Server 加密数据传输 is below entry TCP Socket 升级为单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexPairOrder0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0036 begin');
      expect(await ensureIndex()).assertTrue();
      const first: number = await textTop('TCP Socket 升级为单向TLS Socket 加密数据传输');
      const second: number = await textTop('TLS Socket Server 加密数据传输');
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(second > first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexPairOrder0036 end');
    })

  })
}
