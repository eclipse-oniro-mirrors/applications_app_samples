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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import {
  ENTRY_ABILITY,
  INTERNET_PERMISSION,
  SELF_FLAGS,
  testPath,
  writeText
} from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const PERMISSION_FLAGS: number = SELF_FLAGS |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;

const INVALID_URLS: Array<string> = [
  '',
  'not-a-url',
  'http://',
  'http:///',
  'ftp://example.com/image.jpg',
  'file:///data/storage/image.jpg',
  'http://127.0.0.1:1/image.jpg',
  'https://127.0.0.1:1/image.jpg',
  'http://[::1]:1/image.jpg',
  ' http://example.com/image.jpg',
  'https://exa mple.com/image.jpg',
  'http://example.com:99999/image.jpg',
  'https://invalid.invalid/image.jpg',
  '//example.com/image.jpg',
  'http:/example.com/image.jpg',
  'http://example .com/image.jpg',
  'https://localhost:1/image.jpg',
  'http://0.0.0.0:1/image.jpg',
  'https://256.256.256.256/image.jpg',
  'http://example.com\\image.jpg'
];

class NetOutcome {
  code: number = -1;
  elapsed: number = 0;
}

async function probe(url: string, method: http.RequestMethod, connectTimeout: number,
  readTimeout: number): Promise<NetOutcome> {
  const outcome: NetOutcome = new NetOutcome();
  const started: number = Date.now();
  const request: http.HttpRequest = http.createHttp();
  try {
    const header: Record<string, string> = { 'Accept': 'image/*' };
    const options: http.HttpRequestOptions = {
      method: method,
      expectDataType: http.HttpDataType.ARRAY_BUFFER,
      usingCache: false,
      connectTimeout: connectTimeout,
      readTimeout: readTimeout,
      header: header
    };
    const response: http.HttpResponse = await request.request(url, options);
    outcome.code = response.responseCode;
  } catch (error) {
    outcome.code = Number((error as BusinessError).code);
  } finally {
    request.destroy();
    outcome.elapsed = Date.now() - started;
  }
  return outcome;
}

export default function networkContractMatrixTest() {
  describe('NetworkContractMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0001
     * @tc.name      testNetwork0001
     * @tc.desc      Response code OK is 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.OK).assertEqual(200);
      logCase('testNetwork0001', 'contract case 1');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0002
     * @tc.name      testNetwork0002
     * @tc.desc      Response code CREATED is 201
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.CREATED).assertEqual(201);
      logCase('testNetwork0002', 'contract case 2');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0003
     * @tc.name      testNetwork0003
     * @tc.desc      Response code ACCEPTED is 202
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.ACCEPTED).assertEqual(202);
      logCase('testNetwork0003', 'contract case 3');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0004
     * @tc.name      testNetwork0004
     * @tc.desc      Response code NO_CONTENT is 204
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.NO_CONTENT).assertEqual(204);
      logCase('testNetwork0004', 'contract case 4');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0005
     * @tc.name      testNetwork0005
     * @tc.desc      Response code NOT_FOUND is 404
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.NOT_FOUND).assertEqual(404);
      logCase('testNetwork0005', 'contract case 5');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0006
     * @tc.name      testNetwork0006
     * @tc.desc      Response code INTERNAL_ERROR is 500
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.INTERNAL_ERROR).assertEqual(500);
      logCase('testNetwork0006', 'contract case 6');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0007
     * @tc.name      testNetwork0007
     * @tc.desc      Method GET keeps the GET token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.GET).assertEqual('GET');
      logCase('testNetwork0007', 'contract case 7');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0008
     * @tc.name      testNetwork0008
     * @tc.desc      Method POST keeps the POST token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.POST).assertEqual('POST');
      logCase('testNetwork0008', 'contract case 8');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0009
     * @tc.name      testNetwork0009
     * @tc.desc      Method HEAD keeps the HEAD token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.HEAD).assertEqual('HEAD');
      logCase('testNetwork0009', 'contract case 9');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0010
     * @tc.name      testNetwork0010
     * @tc.desc      Method PUT keeps the PUT token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.PUT).assertEqual('PUT');
      logCase('testNetwork0010', 'contract case 10');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0011
     * @tc.name      testNetwork0011
     * @tc.desc      Method DELETE keeps the DELETE token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.DELETE).assertEqual('DELETE');
      logCase('testNetwork0011', 'contract case 11');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0012
     * @tc.name      testNetwork0012
     * @tc.desc      Method OPTIONS keeps the OPTIONS token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.OPTIONS).assertEqual('OPTIONS');
      logCase('testNetwork0012', 'contract case 12');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0013
     * @tc.name      testNetwork0013
     * @tc.desc      Method TRACE keeps the TRACE token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.TRACE).assertEqual('TRACE');
      logCase('testNetwork0013', 'contract case 13');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0014
     * @tc.name      testNetwork0014
     * @tc.desc      Data type STRING is 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.HttpDataType.STRING).assertEqual(0);
      logCase('testNetwork0014', 'contract case 14');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0015
     * @tc.name      testNetwork0015
     * @tc.desc      Data type OBJECT is 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.HttpDataType.OBJECT).assertEqual(1);
      logCase('testNetwork0015', 'contract case 15');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0016
     * @tc.name      testNetwork0016
     * @tc.desc      Data type ARRAY_BUFFER is 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.HttpDataType.ARRAY_BUFFER).assertEqual(2);
      logCase('testNetwork0016', 'contract case 16');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0017
     * @tc.name      testNetwork0017
     * @tc.desc      Fresh request object exposes request function
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const request: http.HttpRequest = http.createHttp();
      expect(typeof request.request).assertEqual('function');
      request.destroy();
      logCase('testNetwork0017', 'contract case 17');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0018
     * @tc.name      testNetwork0018
     * @tc.desc      Fresh request object exposes destroy function
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const request: http.HttpRequest = http.createHttp();
      expect(typeof request.destroy).assertEqual('function');
      request.destroy();
      logCase('testNetwork0018', 'contract case 18');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0019
     * @tc.name      testNetwork0019
     * @tc.desc      Fresh request object exposes on function
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const request: http.HttpRequest = http.createHttp();
      expect(typeof request.on).assertEqual('function');
      request.destroy();
      logCase('testNetwork0019', 'contract case 19');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0020
     * @tc.name      testNetwork0020
     * @tc.desc      Fresh request object exposes off function
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const request: http.HttpRequest = http.createHttp();
      expect(typeof request.off).assertEqual('function');
      request.destroy();
      logCase('testNetwork0020', 'contract case 20');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0021
     * @tc.name      testNetwork0021
     * @tc.desc      Two request objects are distinct instances
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const first: http.HttpRequest = http.createHttp();
      const second: http.HttpRequest = http.createHttp();
      expect(first === second).assertFalse();
      first.destroy();
      second.destroy();
      logCase('testNetwork0021', 'contract case 21');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0022
     * @tc.name      testNetwork0022
     * @tc.desc      Destroy can be called right after creation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const request: http.HttpRequest = http.createHttp();
      request.destroy();
      expect(http.ResponseCode.OK).assertEqual(200);
      logCase('testNetwork0022', 'contract case 22');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0023
     * @tc.name      testNetwork0023
     * @tc.desc      GET token differs from POST token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const get: string = http.RequestMethod.GET;
      const post: string = http.RequestMethod.POST;
      expect(get === post).assertFalse();
      logCase('testNetwork0023', 'contract case 23');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0024
     * @tc.name      testNetwork0024
     * @tc.desc      OK code differs from INTERNAL_ERROR code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ok: number = http.ResponseCode.OK;
      const failure: number = http.ResponseCode.INTERNAL_ERROR;
      expect(ok === failure).assertFalse();
      logCase('testNetwork0024', 'contract case 24');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0025
     * @tc.name      testNetwork0025
     * @tc.desc      STRING data type differs from ARRAY_BUFFER data type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const textType: number = http.HttpDataType.STRING;
      const bufferType: number = http.HttpDataType.ARRAY_BUFFER;
      expect(textType === bufferType).assertFalse();
      logCase('testNetwork0025', 'contract case 25');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0026
     * @tc.name      testNetwork0026
     * @tc.desc      Permission flag combines with self flags
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(PERMISSION_FLAGS > SELF_FLAGS).assertTrue();
      expect(PERMISSION_FLAGS % 2).assertEqual(1);
      logCase('testNetwork0026', 'contract case 26');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0027
     * @tc.name      testNetwork0027
     * @tc.desc      OK code is even and divisible by one hundred
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.OK % 100).assertEqual(0);
      expect(http.ResponseCode.OK % 2).assertEqual(0);
      logCase('testNetwork0027', 'contract case 27');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0028
     * @tc.name      testNetwork0028
     * @tc.desc      NOT_FOUND code is greater than OK code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.ResponseCode.NOT_FOUND > http.ResponseCode.OK).assertTrue();
      logCase('testNetwork0028', 'contract case 28');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0029
     * @tc.name      testNetwork0029
     * @tc.desc      GET method token has three characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(http.RequestMethod.GET.length).assertEqual(3);
      expect(http.RequestMethod.HEAD.length).assertEqual(4);
      logCase('testNetwork0029', 'contract case 29');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0030
     * @tc.name      testNetwork0030
     * @tc.desc      Malformed url slot 1 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[0];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0030', 'contract case 30');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0031
     * @tc.name      testNetwork0031
     * @tc.desc      Malformed url slot 1 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[0];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0031', 'contract case 31');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0032
     * @tc.name      testNetwork0032
     * @tc.desc      Malformed url slot 2 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[1];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0032', 'contract case 32');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0033
     * @tc.name      testNetwork0033
     * @tc.desc      Malformed url slot 2 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[1];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0033', 'contract case 33');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0034
     * @tc.name      testNetwork0034
     * @tc.desc      Malformed url slot 3 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[2];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0034', 'contract case 34');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0035
     * @tc.name      testNetwork0035
     * @tc.desc      Malformed url slot 3 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[2];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0035', 'contract case 35');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0036
     * @tc.name      testNetwork0036
     * @tc.desc      Malformed url slot 4 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[3];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0036', 'contract case 36');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0037
     * @tc.name      testNetwork0037
     * @tc.desc      Malformed url slot 4 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[3];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0037', 'contract case 37');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0038
     * @tc.name      testNetwork0038
     * @tc.desc      Malformed url slot 5 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[4];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0038', 'contract case 38');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0039
     * @tc.name      testNetwork0039
     * @tc.desc      Malformed url slot 5 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[4];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0039', 'contract case 39');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0040
     * @tc.name      testNetwork0040
     * @tc.desc      Malformed url slot 6 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[5];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0040', 'contract case 40');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0041
     * @tc.name      testNetwork0041
     * @tc.desc      Malformed url slot 6 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[5];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0041', 'contract case 41');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0042
     * @tc.name      testNetwork0042
     * @tc.desc      Malformed url slot 7 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[6];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0042', 'contract case 42');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0043
     * @tc.name      testNetwork0043
     * @tc.desc      Malformed url slot 7 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[6];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0043', 'contract case 43');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0044
     * @tc.name      testNetwork0044
     * @tc.desc      Malformed url slot 8 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[7];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0044', 'contract case 44');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0045
     * @tc.name      testNetwork0045
     * @tc.desc      Malformed url slot 8 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[7];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0045', 'contract case 45');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0046
     * @tc.name      testNetwork0046
     * @tc.desc      Malformed url slot 9 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[8];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0046', 'contract case 46');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0047
     * @tc.name      testNetwork0047
     * @tc.desc      Malformed url slot 9 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[8];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0047', 'contract case 47');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0048
     * @tc.name      testNetwork0048
     * @tc.desc      Malformed url slot 10 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[9];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0048', 'contract case 48');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0049
     * @tc.name      testNetwork0049
     * @tc.desc      Malformed url slot 10 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[9];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0049', 'contract case 49');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0050
     * @tc.name      testNetwork0050
     * @tc.desc      Malformed url slot 11 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[10];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0050', 'contract case 50');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0051
     * @tc.name      testNetwork0051
     * @tc.desc      Malformed url slot 11 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[10];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0051', 'contract case 51');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0052
     * @tc.name      testNetwork0052
     * @tc.desc      Malformed url slot 12 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[11];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0052', 'contract case 52');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0053
     * @tc.name      testNetwork0053
     * @tc.desc      Malformed url slot 12 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[11];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0053', 'contract case 53');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0054
     * @tc.name      testNetwork0054
     * @tc.desc      Malformed url slot 13 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[12];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0054', 'contract case 54');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0055
     * @tc.name      testNetwork0055
     * @tc.desc      Malformed url slot 13 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[12];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0055', 'contract case 55');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0056
     * @tc.name      testNetwork0056
     * @tc.desc      Malformed url slot 14 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[13];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0056', 'contract case 56');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0057
     * @tc.name      testNetwork0057
     * @tc.desc      Malformed url slot 14 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[13];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0057', 'contract case 57');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0058
     * @tc.name      testNetwork0058
     * @tc.desc      Malformed url slot 15 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[14];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0058', 'contract case 58');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0059
     * @tc.name      testNetwork0059
     * @tc.desc      Malformed url slot 15 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[14];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0059', 'contract case 59');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0060
     * @tc.name      testNetwork0060
     * @tc.desc      Malformed url slot 16 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNetwork0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const url: string = INVALID_URLS[15];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0060', 'contract case 60');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0061
     * @tc.name      testNetwork0061
     * @tc.desc      Malformed url slot 16 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[15];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0061', 'contract case 61');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0062
     * @tc.name      testNetwork0062
     * @tc.desc      Malformed url slot 17 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[16];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0062', 'contract case 62');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0063
     * @tc.name      testNetwork0063
     * @tc.desc      Malformed url slot 17 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[16];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0063', 'contract case 63');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0064
     * @tc.name      testNetwork0064
     * @tc.desc      Malformed url slot 18 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[17];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0064', 'contract case 64');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0065
     * @tc.name      testNetwork0065
     * @tc.desc      Malformed url slot 18 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[17];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0065', 'contract case 65');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0066
     * @tc.name      testNetwork0066
     * @tc.desc      Malformed url slot 19 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[18];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0066', 'contract case 66');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0067
     * @tc.name      testNetwork0067
     * @tc.desc      Malformed url slot 19 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[18];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0067', 'contract case 67');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0068
     * @tc.name      testNetwork0068
     * @tc.desc      Malformed url slot 20 variant 1 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[19];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.GET, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0068', 'contract case 68');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0069
     * @tc.name      testNetwork0069
     * @tc.desc      Malformed url slot 20 variant 2 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const url: string = INVALID_URLS[19];
      const outcome: NetOutcome = await probe(url, http.RequestMethod.HEAD, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 60000).assertTrue();
      logCase('testNetwork0069', 'contract case 69');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0070
     * @tc.name      testNetwork0070
     * @tc.desc      Refused endpoint http://127.0.0.1:1 with timeout 100 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://127.0.0.1:1/image-0000.jpg',
        http.RequestMethod.GET, 100, 100);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0070', 'contract case 70');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0071
     * @tc.name      testNetwork0071
     * @tc.desc      Refused endpoint http://localhost:1 with timeout 150 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://localhost:1/image-0001.jpg',
        http.RequestMethod.HEAD, 150, 150);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0071', 'contract case 71');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0072
     * @tc.name      testNetwork0072
     * @tc.desc      Refused endpoint http://0.0.0.0:1 with timeout 200 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://0.0.0.0:1/image-0002.jpg',
        http.RequestMethod.GET, 200, 200);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0072', 'contract case 72');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0073
     * @tc.name      testNetwork0073
     * @tc.desc      Refused endpoint http://127.0.0.1:1 with timeout 250 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://127.0.0.1:1/image-0003.jpg',
        http.RequestMethod.HEAD, 250, 250);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0073', 'contract case 73');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0074
     * @tc.name      testNetwork0074
     * @tc.desc      Refused endpoint http://localhost:1 with timeout 300 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://localhost:1/image-0004.jpg',
        http.RequestMethod.GET, 300, 300);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0074', 'contract case 74');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0075
     * @tc.name      testNetwork0075
     * @tc.desc      Refused endpoint http://0.0.0.0:1 with timeout 350 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://0.0.0.0:1/image-0005.jpg',
        http.RequestMethod.HEAD, 350, 350);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0075', 'contract case 75');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0076
     * @tc.name      testNetwork0076
     * @tc.desc      Refused endpoint http://127.0.0.1:1 with timeout 400 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://127.0.0.1:1/image-0006.jpg',
        http.RequestMethod.GET, 400, 400);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0076', 'contract case 76');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0077
     * @tc.name      testNetwork0077
     * @tc.desc      Refused endpoint http://localhost:1 with timeout 450 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://localhost:1/image-0007.jpg',
        http.RequestMethod.HEAD, 450, 450);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0077', 'contract case 77');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0078
     * @tc.name      testNetwork0078
     * @tc.desc      Refused endpoint http://0.0.0.0:1 with timeout 500 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://0.0.0.0:1/image-0008.jpg',
        http.RequestMethod.GET, 500, 500);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0078', 'contract case 78');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0079
     * @tc.name      testNetwork0079
     * @tc.desc      Refused endpoint http://127.0.0.1:1 with timeout 600 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://127.0.0.1:1/image-0009.jpg',
        http.RequestMethod.HEAD, 600, 600);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0079', 'contract case 79');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0080
     * @tc.name      testNetwork0080
     * @tc.desc      Refused endpoint http://localhost:1 with timeout 700 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://localhost:1/image-0010.jpg',
        http.RequestMethod.GET, 700, 700);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0080', 'contract case 80');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0081
     * @tc.name      testNetwork0081
     * @tc.desc      Refused endpoint http://0.0.0.0:1 with timeout 800 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://0.0.0.0:1/image-0011.jpg',
        http.RequestMethod.HEAD, 800, 800);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0081', 'contract case 81');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0082
     * @tc.name      testNetwork0082
     * @tc.desc      Refused endpoint http://127.0.0.1:1 with timeout 900 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://127.0.0.1:1/image-0012.jpg',
        http.RequestMethod.GET, 900, 900);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0082', 'contract case 82');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0083
     * @tc.name      testNetwork0083
     * @tc.desc      Refused endpoint http://localhost:1 with timeout 1000 never yields status 200
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNetwork0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outcome: NetOutcome = await probe('http://localhost:1/image-0013.jpg',
        http.RequestMethod.HEAD, 1000, 1000);
      expect(outcome.code !== http.ResponseCode.OK).assertTrue();
      expect(outcome.elapsed >= 0).assertTrue();
      expect(outcome.elapsed < 30000).assertTrue();
      logCase('testNetwork0083', 'contract case 83');
    });
    /**
     * @tc.number    SUB_PREHTTP_NET_0084
     * @tc.name      testNetwork0084
     * @tc.desc      Refused endpoint http://0.0.0.0:1 with timeout 1200 never yields status 200
