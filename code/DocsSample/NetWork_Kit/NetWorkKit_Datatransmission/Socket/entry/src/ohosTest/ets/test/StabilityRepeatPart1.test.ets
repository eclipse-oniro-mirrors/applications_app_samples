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
import { openPage, backToIndex } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function StabilityRepeatPart1Test(): void {
  describe('StabilityRepeatPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_STABP1_0100
     * @tc.name      testStability0001
     * @tc.desc      Verify three repeated visits to LocalSocket succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0001 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0200
     * @tc.name      testStability0002
     * @tc.desc      Verify three repeated visits to Multicast succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0002 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('多播通信', '启动多播通信'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0300
     * @tc.name      testStability0003
     * @tc.desc      Verify three repeated visits to OneWayTls succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0003 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('单向TLS Socket 加密数据传输', '选择'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0400
     * @tc.name      testStability0004
     * @tc.desc      Verify three repeated visits to Tcp2OneWayTls succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0004 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0500
     * @tc.name      testStability0005
     * @tc.desc      Verify three repeated visits to Tcp2TwoWayTls succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0005 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0600
     * @tc.name      testStability0006
     * @tc.desc      Verify three repeated visits to TcpClient succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0006 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('Tcp客户端', '连接'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0700
     * @tc.name      testStability0007
     * @tc.desc      Verify three repeated visits to TcpServer succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0007 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('Tcp服务端', '启动服务器'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0800
     * @tc.name      testStability0008
     * @tc.desc      Verify three repeated visits to TlsServer succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0008 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('TLS Socket Server 加密数据传输', '选择'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_0900
     * @tc.name      testStability0009
     * @tc.desc      Verify three repeated visits to TwoWayTls succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0009 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('双向TLS Socket 加密数据传输', '选择'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_STABP1_1000
     * @tc.name      testStability0010
     * @tc.desc      Verify three repeated visits to UdpClient_Server succeed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStability0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0010 begin');
      let ok: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        if (!(await openPage('Udp客户端&服务端', '启动服务器'))) { ok = false; }
        if (!(await backToIndex())) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStability0010 end');
    })

  })
}
