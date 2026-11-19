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
import { openPage, backToIndex, waitForText } from './shared/SocketUiSupport';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';

export default function PageButtonCatalogPart1Test(): void {
  describe('PageButtonCatalogPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0100
     * @tc.name      testPageButton0001
     * @tc.desc      Verify LocalSocket exposes secondary control 开始Local_Socket通信.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0001 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await waitForText('开始Local_Socket通信', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0200
     * @tc.name      testPageButton0002
     * @tc.desc      Verify LocalSocket exposes secondary control 关闭Socket服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0002 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await waitForText('关闭Socket服务', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0300
     * @tc.name      testPageButton0003
     * @tc.desc      Verify OneWayTls exposes secondary control 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0003 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('加载', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0400
     * @tc.name      testPageButton0004
     * @tc.desc      Verify OneWayTls exposes secondary control 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0004 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0500
     * @tc.name      testPageButton0005
     * @tc.desc      Verify OneWayTls exposes secondary control 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0005 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('关闭连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0600
     * @tc.name      testPageButton0006
     * @tc.desc      Verify OneWayTls exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0006 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0700
     * @tc.name      testPageButton0007
     * @tc.desc      Verify Tcp2OneWayTls exposes secondary control 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0007 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('加载', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0800
     * @tc.name      testPageButton0008
     * @tc.desc      Verify Tcp2OneWayTls exposes secondary control 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0008 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_0900
     * @tc.name      testPageButton0009
     * @tc.desc      Verify Tcp2OneWayTls exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0009 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1000
     * @tc.name      testPageButton0010
     * @tc.desc      Verify Tcp2TwoWayTls exposes secondary control 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0010 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('加载', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1100
     * @tc.name      testPageButton0011
     * @tc.desc      Verify Tcp2TwoWayTls exposes secondary control 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0011 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1200
     * @tc.name      testPageButton0012
     * @tc.desc      Verify Tcp2TwoWayTls exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0012 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1300
     * @tc.name      testPageButton0013
     * @tc.desc      Verify Tcp2TwoWayTls exposes secondary control 关闭服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0013 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('关闭服务', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1400
     * @tc.name      testPageButton0014
     * @tc.desc      Verify TcpClient exposes secondary control 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0014 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await waitForText('关闭连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1500
     * @tc.name      testPageButton0015
     * @tc.desc      Verify TcpServer exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0015 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1600
     * @tc.name      testPageButton0016
     * @tc.desc      Verify TcpServer exposes secondary control 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0016 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('关闭连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1700
     * @tc.name      testPageButton0017
     * @tc.desc      Verify TlsServer exposes secondary control 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0017 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('加载', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1800
     * @tc.name      testPageButton0018
     * @tc.desc      Verify TlsServer exposes secondary control 启动服务器.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0018 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('启动服务器', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_1900
     * @tc.name      testPageButton0019
     * @tc.desc      Verify TlsServer exposes secondary control 停止服务.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0019 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('停止服务', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_2000
     * @tc.name      testPageButton0020
     * @tc.desc      Verify TwoWayTls exposes secondary control 加载.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0020 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('加载', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_2100
     * @tc.name      testPageButton0021
     * @tc.desc      Verify TwoWayTls exposes secondary control 连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0021 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_2200
     * @tc.name      testPageButton0022
     * @tc.desc      Verify TwoWayTls exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0022 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_2300
     * @tc.name      testPageButton0023
     * @tc.desc      Verify UdpClient_Server exposes secondary control 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0023 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGEBTNP1_2400
     * @tc.name      testPageButton0024
     * @tc.desc      Verify UdpClient_Server exposes secondary control 关闭连接.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageButton0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0024 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('关闭连接', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageButton0024 end');
    })

  })
}
