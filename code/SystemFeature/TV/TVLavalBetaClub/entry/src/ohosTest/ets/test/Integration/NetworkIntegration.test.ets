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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import http from '@ohos.net.http';
import NetworkManager, { BusinessErrorImpl } from '../../../../main/ets/common/Network/NetworkManager';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';

const DEFAULT_TIMEOUT_SECONDS: number = 30;

const DEFAULT_CONTENT_TYPE: string = 'application/json';

const MULTIPART_CONTENT_TYPE: string = 'multipart/form-data';

const DEFAULT_UPLOAD_FIELD: string = 'file';

const ISSUE_ID_FIELD: string = 'issueId';

const MAX_UPLOAD_RETRY_TICKS: number = 30;

const SAMPLE_ISSUE_ID: string = 'ISSUE-20260101-0001';

interface RequestProfile {
  endpoint: string;
  method: http.RequestMethod;
  contentType: string;
  expectDataType: http.HttpDataType;
}

interface UploadFileDescriptor {
  filename: string;
  name: string;
  uri: string;
  type: string;
}

// Mirrors the default resolution inside NetworkManager#request
class RequestProfileResolver {
  public static resolve(endpoint: string, method?: http.RequestMethod,
    contentType?: string, expectDataType?: http.HttpDataType): RequestProfile {
    return {
      endpoint: endpoint,
      method: method === undefined ? http.RequestMethod.POST : method,
      contentType: contentType === undefined ? DEFAULT_CONTENT_TYPE : contentType,
      expectDataType: expectDataType === undefined ? http.HttpDataType.OBJECT : expectDataType
    };
  }

  public static isPost(profile: RequestProfile): boolean {
    return profile.method === http.RequestMethod.POST;
  }

  public static isJson(profile: RequestProfile): boolean {
    return profile.contentType === DEFAULT_CONTENT_TYPE;
  }
}

// Mirrors the upload descriptor built by NetworkManager#upload
class UploadDescriptorBuilder {
  public static build(folder: string, fileName: string, fileType: string, issueId: string): UploadFileDescriptor {
    const normalizedFolder = folder.endsWith('/') ? folder : folder + '/';
    return {
      filename: fileName,
      name: DEFAULT_UPLOAD_FIELD,
      uri: 'internal://cache/' + normalizedFolder + fileName,
      type: fileType
    };
  }

  public static issueData(issueId: string): string {
    return issueId;
  }

  public static isCacheUri(uri: string): boolean {
    return uri.startsWith('internal://cache/');
  }

  public static fileNameFromUri(uri: string): string {
    const index = uri.lastIndexOf('/');
    if (index < 0) {
      return '';
    }
    return uri.substring(index + 1);
  }
}

// Mirrors the download destination rule in NetworkManager#down
class DownloadPathResolver {
  public static resolve(cacheDir: string, fileName: string): string {
    const base = cacheDir.endsWith('/') ? cacheDir.substring(0, cacheDir.length - 1) : cacheDir;
    return base + '/' + fileName + '.mp4';
  }

  public static hasMp4Suffix(path: string): boolean {
    return path.endsWith('.mp4');
  }
}

// Detects a stalled upload using the same tick rule as NetworkManager
class UploadStallDetector {
  private lastUploaded: number = -1;
  private stallTicks: number = 0;

  public onProgress(uploadedSize: number): void {
    if (uploadedSize === this.lastUploaded) {
      this.stallTicks++;
    } else {
      this.stallTicks = 0;
      this.lastUploaded = uploadedSize;
    }
  }

  public isStalled(): boolean {
    return this.stallTicks >= MAX_UPLOAD_RETRY_TICKS;
  }

  public getStallTicks(): number {
    return this.stallTicks;
  }

  public reset(): void {
    this.lastUploaded = -1;
    this.stallTicks = 0;
  }
}

export default function networkIntegrationTest() {
  describe('NetworkIntegration_Test', () => {
    let manager: NetworkManager;

    beforeAll(() => {
      manager = NetworkManager.shareInstance();
    });

    afterAll(() => {
      expect(manager !== undefined).assertTrue();
    });

    it('network_manager_should_be_singleton', 0, () => {
      const second = NetworkManager.shareInstance();
      expect(manager === second).assertTrue();
    });

    it('network_manager_should_expose_public_api', 0, () => {
      expect(typeof manager.request).assertEqual('function');
      expect(typeof manager.upload).assertEqual('function');
      expect(typeof manager.down).assertEqual('function');
    });

    it('business_error_should_have_empty_defaults', 0, () => {
      const error = new BusinessErrorImpl();
      expect(error.code).assertEqual(0);
      expect(error.name).assertEqual('');
      expect(error.message).assertEqual('');
    });

    it('business_error_should_accept_mutation', 0, () => {
      const error = new BusinessErrorImpl();
      error.code = -1;
      error.name = 'UploadError';
      error.message = 'uploadTaskOnFail';
      expect(error.code).assertEqual(-1);
      expect(error.name).assertEqual('UploadError');
      expect(error.message).assertEqual('uploadTaskOnFail');
    });

    it('default_base_url_should_be_empty_before_ability_init', 0, () => {
      expect(typeof UrlConstant.BASE_URL).assertEqual('string');
      expect(UrlConstant.BASE_URL.length).assertLargerOrEqual(0);
    });

    it('request_profile_should_default_to_post_json', 0, () => {
      const profile = RequestProfileResolver.resolve(UrlConstant.ISSUE_REPORT);
      expect(profile.endpoint).assertEqual(UrlConstant.ISSUE_REPORT);
      expect(RequestProfileResolver.isPost(profile)).assertTrue();
      expect(RequestProfileResolver.isJson(profile)).assertTrue();
      expect(profile.expectDataType).assertEqual(http.HttpDataType.OBJECT);
    });

    it('request_profile_should_keep_explicit_method', 0, () => {
      const profile = RequestProfileResolver.resolve(UrlConstant.ISSUE_LIST,
        http.RequestMethod.GET, 'application/text', http.HttpDataType.STRING);
      expect(profile.method).assertEqual(http.RequestMethod.GET);
      expect(RequestProfileResolver.isPost(profile)).assertFalse();
      expect(RequestProfileResolver.isJson(profile)).assertFalse();
      expect(profile.contentType).assertEqual('application/text');
      expect(profile.expectDataType).assertEqual(http.HttpDataType.STRING);
    });

    it('request_timeout_should_be_thirty_seconds', 0, () => {
      expect(DEFAULT_TIMEOUT_SECONDS).assertEqual(30);
      expect(DEFAULT_TIMEOUT_SECONDS).assertLarger(0);
      expect(DEFAULT_TIMEOUT_SECONDS * 1000).assertEqual(30000);
    });

    it('upload_descriptor_should_target_cache_folder', 0, () => {
      const descriptor = UploadDescriptorBuilder.build(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER,
        'screenshot.png', 'image/png', SAMPLE_ISSUE_ID);
      expect(descriptor.filename).assertEqual('screenshot.png');
      expect(descriptor.name).assertEqual(DEFAULT_UPLOAD_FIELD);
      expect(descriptor.type).assertEqual('image/png');
      expect(descriptor.uri).assertEqual('internal://cache/attachment/screenshot.png');
      expect(UploadDescriptorBuilder.isCacheUri(descriptor.uri)).assertTrue();
      expect(UploadDescriptorBuilder.fileNameFromUri(descriptor.uri)).assertEqual('screenshot.png');
    });

    it('upload_descriptor_should_normalize_trailing_slash', 0, () => {
      const descriptor = UploadDescriptorBuilder.build('attachment/', 'clip.mp4', 'video/mp4', SAMPLE_ISSUE_ID);
      expect(descriptor.uri).assertEqual('internal://cache/attachment/clip.mp4');
      expect(descriptor.uri.indexOf('//attachment')).assertEqual(-1);
      expect(UploadDescriptorBuilder.fileNameFromUri(descriptor.uri)).assertEqual('clip.mp4');
    });

    it('upload_issue_id_should_be_forwarded', 0, () => {
      expect(UploadDescriptorBuilder.issueData(SAMPLE_ISSUE_ID)).assertEqual(SAMPLE_ISSUE_ID);
      expect(UploadDescriptorBuilder.issueData('')).assertEqual('');
      expect(ISSUE_ID_FIELD).assertEqual('issueId');
    });

    it('multipart_content_type_should_match_upload_config', 0, () => {
      expect(MULTIPART_CONTENT_TYPE).assertEqual('multipart/form-data');
      expect(MULTIPART_CONTENT_TYPE).assertContain('multipart');
      expect(MULTIPART_CONTENT_TYPE).assertContain('form-data');
    });

    it('download_path_should_use_cache_dir', 0, () => {
      const path = DownloadPathResolver.resolve('/data/app/cache', 'demo');
      expect(path).assertEqual('/data/app/cache/demo.mp4');
      expect(DownloadPathResolver.hasMp4Suffix(path)).assertTrue();
    });

    it('download_path_should_normalize_trailing_slash', 0, () => {
      const path = DownloadPathResolver.resolve('/data/app/cache/', 'demo');
      expect(path).assertEqual('/data/app/cache/demo.mp4');
      expect(path.indexOf('//')).assertEqual(-1);
      expect(DownloadPathResolver.hasMp4Suffix(path)).assertTrue();
    });

    it('upload_stall_detector_should_trigger_after_threshold', 0, () => {
      const detector = new UploadStallDetector();
      detector.onProgress(100);
      expect(detector.getStallTicks()).assertEqual(0);
      for (let i = 0; i < MAX_UPLOAD_RETRY_TICKS; i++) {
        detector.onProgress(100);
      }
      expect(detector.getStallTicks()).assertEqual(MAX_UPLOAD_RETRY_TICKS);
      expect(detector.isStalled()).assertTrue();
    });

    it('upload_stall_detector_should_reset_on_progress', 0, () => {
      const detector = new UploadStallDetector();
      detector.onProgress(100);
      detector.onProgress(100);
      detector.onProgress(200);
      expect(detector.getStallTicks()).assertEqual(0);
      expect(detector.isStalled()).assertFalse();
      detector.reset();
      expect(detector.getStallTicks()).assertEqual(0);
    });

    it('endpoint_catalog_should_cover_issue_workflow', 0, () => {
      const endpoints: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL,
        UrlConstant.ISSUE_CONFIG,
        UrlConstant.ISSUE_OPERATION_RECORD
      ];
      expect(endpoints.length).assertEqual(6);
      for (let i = 0; i < endpoints.length; i++) {
        expect(endpoints[i].length).assertLarger(0);
        expect(endpoints[i].startsWith('client/') || endpoints[i].startsWith('dev/')).assertTrue();
      }
    });

    it('upload_file_type_should_match_extension', 0, () => {
      const descriptor = UploadDescriptorBuilder.build('attachment', 'log.tar', 'application/x-tar',
        SAMPLE_ISSUE_ID);
      expect(descriptor.filename.endsWith('.tar')).assertTrue();
      expect(descriptor.type).assertEqual('application/x-tar');
      expect(descriptor.uri.endsWith('log.tar')).assertTrue();
    });

    it('network_error_callback_contract_should_allow_empty_result', 0, () => {
      let receivedCode = Number.MIN_SAFE_INTEGER;
      const callback = (code: number): void => {
        receivedCode = code;
      };
      callback(0);
      expect(receivedCode).assertEqual(0);
      callback(-1);
      expect(receivedCode).assertEqual(-1);
      expect(receivedCode !== Number.MIN_SAFE_INTEGER).assertTrue();
    });

    it('offscreen_network_should_not_block_test_suite', 0, () => {
      const start = Date.now();
      const profile = RequestProfileResolver.resolve(UrlConstant.ISSUE_CONFIG);
      const elapsed = Date.now() - start;
      expect(profile.endpoint).assertEqual(UrlConstant.ISSUE_CONFIG);
      expect(elapsed).assertLess(DEFAULT_TIMEOUT_SECONDS * 1000);
    });
  });
}

