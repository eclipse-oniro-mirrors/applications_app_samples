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

export default function PageTextCatalogPart1Test(): void {
  describe('PageTextCatalogPart1', () => {

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0100
     * @tc.name      testPageText0001
     * @tc.desc      Verify LocalSocket shows text LocalSocket通信示例.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0001 begin');
      expect(await openPage('LocalSocket 数据传输', '启动LocalSocket服务器')).assertTrue();
      expect(await waitForText('LocalSocket通信示例', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0200
     * @tc.name      testPageText0002
     * @tc.desc      Verify OneWayTls shows text TLS通讯示例.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0002 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('TLS通讯示例', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0300
     * @tc.name      testPageText0003
     * @tc.desc      Verify OneWayTls shows text 本地IP地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0003 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('本地IP地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0400
     * @tc.name      testPageText0004
     * @tc.desc      Verify OneWayTls shows text 服务端地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0004 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('服务端地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0500
     * @tc.name      testPageText0005
     * @tc.desc      Verify OneWayTls shows text CA(输入或者加载).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0005 begin');
      expect(await openPage('单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('CA(输入或者加载)', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0600
     * @tc.name      testPageText0006
     * @tc.desc      Verify Tcp2OneWayTls shows text TCP Socket 升级为单向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0006 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('TCP Socket 升级为单向TLS Socket 加密数据传输', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0700
     * @tc.name      testPageText0007
     * @tc.desc      Verify Tcp2OneWayTls shows text 本地IP地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0007 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('本地IP地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0800
     * @tc.name      testPageText0008
     * @tc.desc      Verify Tcp2OneWayTls shows text 服务端地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0008 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('服务端地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_0900
     * @tc.name      testPageText0009
     * @tc.desc      Verify Tcp2OneWayTls shows text CA证书文件.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0009 begin');
      expect(await openPage('TCP Socket 升级为单向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('CA证书文件', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1000
     * @tc.name      testPageText0010
     * @tc.desc      Verify Tcp2TwoWayTls shows text TCP Socket 升级为双向TLS Socket加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0010 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('TCP Socket 升级为双向TLS Socket加密数据传输', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1100
     * @tc.name      testPageText0011
     * @tc.desc      Verify Tcp2TwoWayTls shows text 本地IP地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0011 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('本地IP地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1200
     * @tc.name      testPageText0012
     * @tc.desc      Verify Tcp2TwoWayTls shows text 服务端地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0012 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('服务端地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1300
     * @tc.name      testPageText0013
     * @tc.desc      Verify Tcp2TwoWayTls shows text CA证书文件.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0013 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('CA证书文件', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1400
     * @tc.name      testPageText0014
     * @tc.desc      Verify Tcp2TwoWayTls shows text 客户端证书.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0014 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('客户端证书', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1500
     * @tc.name      testPageText0015
     * @tc.desc      Verify Tcp2TwoWayTls shows text 客户端私钥.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0015 begin');
      expect(await openPage('TCP Socket 升级为双向TLS Socket加密数据传输', '选择')).assertTrue();
      expect(await waitForText('客户端私钥', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1600
     * @tc.name      testPageText0016
     * @tc.desc      Verify TcpClient shows text 输入服务端IP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0016 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await waitForText('输入服务端IP', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1700
     * @tc.name      testPageText0017
     * @tc.desc      Verify TcpClient shows text 输入服务端Port.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0017 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await waitForText('输入服务端Port', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1800
     * @tc.name      testPageText0018
     * @tc.desc      Verify TcpClient shows text 发送.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0018 begin');
      expect(await openPage('Tcp客户端', '连接')).assertTrue();
      expect(await waitForText('发送', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_1900
     * @tc.name      testPageText0019
     * @tc.desc      Verify TcpServer shows text 输入服务端IP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0019 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入服务端IP', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2000
     * @tc.name      testPageText0020
     * @tc.desc      Verify TcpServer shows text 输入服务端Port.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0020 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入服务端Port', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2100
     * @tc.name      testPageText0021
     * @tc.desc      Verify TcpServer shows text 输入消息.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0021 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入消息', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2200
     * @tc.name      testPageText0022
     * @tc.desc      Verify TcpServer shows text 消息记录.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0022 begin');
      expect(await openPage('Tcp服务端', '启动服务器')).assertTrue();
      expect(await waitForText('消息记录', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2300
     * @tc.name      testPageText0023
     * @tc.desc      Verify TlsServer shows text TLS Socket Server 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0023 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('TLS Socket Server 加密数据传输', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2400
     * @tc.name      testPageText0024
     * @tc.desc      Verify TlsServer shows text 服务端地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0024 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('服务端地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2500
     * @tc.name      testPageText0025
     * @tc.desc      Verify TlsServer shows text 选择服务器私钥.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0025 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('选择服务器私钥', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2600
     * @tc.name      testPageText0026
     * @tc.desc      Verify TlsServer shows text 选择服务器证书.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0026 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('选择服务器证书', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0026 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2700
     * @tc.name      testPageText0027
     * @tc.desc      Verify TlsServer shows text CA证书文件.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0027 begin');
      expect(await openPage('TLS Socket Server 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('CA证书文件', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0027 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2800
     * @tc.name      testPageText0028
     * @tc.desc      Verify TwoWayTls shows text 双向TLS Socket 加密数据传输.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0028 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('双向TLS Socket 加密数据传输', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0028 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_2900
     * @tc.name      testPageText0029
     * @tc.desc      Verify TwoWayTls shows text 本地IP地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0029 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('本地IP地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0029 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3000
     * @tc.name      testPageText0030
     * @tc.desc      Verify TwoWayTls shows text 服务端地址.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0030 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('服务端地址', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0030 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3100
     * @tc.name      testPageText0031
     * @tc.desc      Verify TwoWayTls shows text CA证书文件.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0031 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('CA证书文件', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0031 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3200
     * @tc.name      testPageText0032
     * @tc.desc      Verify TwoWayTls shows text 客户端证书.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0032 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('客户端证书', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0032 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3300
     * @tc.name      testPageText0033
     * @tc.desc      Verify TwoWayTls shows text 客户端私钥.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0033 begin');
      expect(await openPage('双向TLS Socket 加密数据传输', '选择')).assertTrue();
      expect(await waitForText('客户端私钥', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0033 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3400
     * @tc.name      testPageText0034
     * @tc.desc      Verify UdpClient_Server shows text 输入服务端IP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0034 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入服务端IP', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0034 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3500
     * @tc.name      testPageText0035
     * @tc.desc      Verify UdpClient_Server shows text 输入服务端Port.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0035 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入服务端Port', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0035 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3600
     * @tc.name      testPageText0036
     * @tc.desc      Verify UdpClient_Server shows text 输入客户端IP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0036 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入客户端IP', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0036 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3700
     * @tc.name      testPageText0037
     * @tc.desc      Verify UdpClient_Server shows text 输入客户端Port.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0037 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入客户端Port', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0037 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3800
     * @tc.name      testPageText0038
     * @tc.desc      Verify UdpClient_Server shows text 输入消息.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0038 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('输入消息', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0038 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PAGETXTP1_3900
     * @tc.name      testPageText0039
     * @tc.desc      Verify UdpClient_Server shows text 消息记录.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageText0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0039 begin');
      expect(await openPage('Udp客户端&服务端', '启动服务器')).assertTrue();
      expect(await waitForText('消息记录', 2500) !== null).assertTrue();
      expect(await backToIndex()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPageText0039 end');
    })

  })
}
