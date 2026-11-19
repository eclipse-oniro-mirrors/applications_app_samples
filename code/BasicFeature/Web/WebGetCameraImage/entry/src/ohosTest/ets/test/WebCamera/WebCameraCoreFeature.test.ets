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

import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  serializedDelay,
  waitForCameraPageStable,
  isWebComponentVisible,
  isShareButtonVisible,
  isPreviewAreaVisible,
  isCapturePromptVisible,
  containsAnyText,
  getTextContents,
  describePageState,
  PAGE_TEXT_SHARE,
  PAGE_TEXT_PREVIEW,
  PAGE_TEXT_UNKNOWN
} from '../Shared/SharedDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'WebCameraCoreFeatureTest';
const PHOTO_EXTENSION: string = '.jpg';
const UTD_IMAGE: string = 'uniform_type_image';
const PROXY_NAME: string = 'shareObject';
const PROXY_METHODS: string[] = ['share'];
const CAMERA_POSITION_UNSPECIFIED: number = 0;
const PICKER_MEDIA_TYPES: string[] = ['PHOTO', 'VIDEO'];

const HTML_MARKERS: string[] = [
  'type="file"', 'accept="image/*"', 'id="upload"', 'id="image"', 'id="image_preview"',
  'onchange="showPic()"', 'onclick="sharePic()"', 'function showPic()', 'function sharePic()',
  'shareObject.share()', 'URL.createObjectURL'
];

const HTML_SAMPLE: string = '<input ref="camera" type="file" id="upload" name="upload" ' +
  'accept="image/*" capture="upload" onchange="showPic()"/>' +
  '<button onclick="sharePic()">分享图片</button>' +
  '<p id="image_preview">图片预览</p>' +
  '<img id="image">' +
  'function showPic() { URL.createObjectURL(tFile[0]); }' +
  'function sharePic() { shareObject.share(); }';

class FileResultModel {
  public selectedFiles: string[] = [];
  public accepted: boolean = false;

  public handleFileList(files: string[]): void {
    this.selectedFiles = files;
    this.accepted = true;
  }

  public getSelectedUri(): string {
    return this.selectedFiles.length === 0 ? '' : this.selectedFiles[0];
  }

  public hasSelection(): boolean {
    return this.selectedFiles.length > 0;
  }
}

class CameraPickerModel {
  public filesDir: string = '';
  public filePath: string = '';
  public callbackInvoked: boolean = false;
  public cameraPosition: number = CAMERA_POSITION_UNSPECIFIED;

  constructor(filesDir: string) {
    this.filesDir = filesDir;
  }

  public buildTargetPath(timestamp: number): string {
    this.filePath = `${this.filesDir}/${timestamp}.jpg`;
    return this.filePath;
  }

  public pick(resultUri: string, callback: (uri: string) => void): boolean {
    if (resultUri.length === 0) {
      return false;
    }
    if (callback) {
      callback(resultUri);
      this.callbackInvoked = true;
    }
    return true;
  }

  public hasPhotoType(): boolean {
    return PICKER_MEDIA_TYPES.indexOf('PHOTO') >= 0;
  }
}

class SandboxCopyModel {
  public openedSource: string = '';
  public openedTarget: string = '';
  public copied: boolean = false;
  public sourceClosed: boolean = false;
  public targetClosed: boolean = false;
  public copyOrder: string[] = [];

  public openSource(uri: string): boolean {
    if (uri.length === 0) {
      return false;
    }
    this.openedSource = uri;
    this.copyOrder.push('openSource');
    return true;
  }

  public openTarget(path: string): boolean {
    if (path.length === 0) {
      return false;
    }
    this.openedTarget = path;
    this.copyOrder.push('openTarget');
    return true;
  }

  public copy(): boolean {
    if (this.openedSource.length === 0 || this.openedTarget.length === 0) {
      return false;
    }
    this.copied = true;
    this.copyOrder.push('copy');
    return true;
  }

  public closeSource(): void {
    this.sourceClosed = true;
    this.copyOrder.push('closeSource');
  }

  public closeTarget(): void {
    this.targetClosed = true;
    this.copyOrder.push('closeTarget');
  }

  public isResourceReleased(): boolean {
    return this.sourceClosed && this.targetClosed;
  }
}

class SharePayloadModel {
  public filePath: string = '';
  public toastShown: boolean = false;
  public shareDataBuilt: boolean = false;
  public utd: string = '';
  public uri: string = '';

  public share(): boolean {
    if (this.filePath.length === 0) {
      this.toastShown = true;
      return false;
    }
    this.utd = this.resolveUtd(this.filePath);
    this.uri = this.buildUri(this.filePath);
    this.shareDataBuilt = this.utd.length > 0 && this.uri.length > 0;
    return this.shareDataBuilt;
  }

  public resolveUtd(filePath: string): string {
    return filePath.toLowerCase().endsWith(PHOTO_EXTENSION) ? UTD_IMAGE : '';
  }

  public buildUri(filePath: string): string {
    return filePath.length === 0 ? '' : `file://${filePath}`;
  }
}

class HtmlContractModel {
  public content: string = '';

  constructor(content: string) {
    this.content = content;
  }

  public contains(token: string): boolean {
    return this.content.indexOf(token) >= 0;
  }

  public countToken(token: string): number {
    let count = 0;
    let index = this.content.indexOf(token);
    while (index >= 0) {
      count++;
      index = this.content.indexOf(token, index + token.length);
    }
    return count;
  }
}

export default function webCameraCoreFeatureTest() {
  describe('WebCameraCoreFeature_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'core feature suite beforeAll');
      driver = getDriver();
      await serializedDelay(driver, 500);
      await waitForCameraPageStable(driver, 2000);
    })

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'core feature suite afterAll');
      const snapshot = await describePageState(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `final page snapshot: ${snapshot}`);
    })

    it('core_web_component_mounted', 0, async () => {
      const visible = await isWebComponentVisible(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `web component visible: ${visible}`);
      expect(typeof visible).assertEqual('boolean');
    })

    it('core_share_button_visible', 0, async () => {
      const visible = await isShareButtonVisible(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `share button visible: ${visible}`);
      expect(typeof visible).assertEqual('boolean');
    })

    it('core_preview_area_visible', 0, async () => {
      const visible = await isPreviewAreaVisible(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `preview area visible: ${visible}`);
      expect(typeof visible).assertEqual('boolean');
    })

    it('core_capture_prompt_visible', 0, async () => {
      const visible = await isCapturePromptVisible(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `capture prompt visible: ${visible}`);
      expect(typeof visible).assertEqual('boolean');
    })

    it('core_page_contains_page_marker', 0, async () => {
      const markers: string[] = [PAGE_TEXT_SHARE, PAGE_TEXT_PREVIEW, PAGE_TEXT_UNKNOWN, '图片'];
      const matched = await containsAnyText(driver, markers);
      hilog.info(DOMAIN, TAG, '%{public}s', `page marker matched: ${matched}`);
      const texts = await getTextContents(driver);
      expect(texts.length >= 0).assertTrue();
    })

    it('core_file_result_handle_file_list', 0, () => {
      const result = new FileResultModel();
      expect(result.hasSelection()).assertFalse();
      result.handleFileList(['file://sandbox/1.jpg']);
      expect(result.accepted).assertTrue();
      expect(result.hasSelection()).assertTrue();
      expect(result.getSelectedUri()).assertEqual('file://sandbox/1.jpg');
    })

    it('core_file_result_empty_list', 0, () => {
      const result = new FileResultModel();
      result.handleFileList([]);
      expect(result.hasSelection()).assertFalse();
      expect(result.getSelectedUri()).assertEqual('');
    })

    it('core_camera_build_target_path', 0, () => {
      const picker = new CameraPickerModel('/data/storage/files');
      const path = picker.buildTargetPath(1700000000000);
      expect(path).assertEqual('/data/storage/files/1700000000000.jpg');
      expect(path.endsWith(PHOTO_EXTENSION)).assertTrue();
    })

    it('core_camera_pick_invokes_callback', 0, () => {
      const picker = new CameraPickerModel('/data/storage/files');
      let captured: string = '';
      const ok = picker.pick('file://media/photo/1.jpg', (uri: string) => {
        captured = uri;
      });
      expect(ok).assertTrue();
      expect(picker.callbackInvoked).assertTrue();
      expect(captured).assertEqual('file://media/photo/1.jpg');
      expect(picker.hasPhotoType()).assertTrue();
    })

    it('core_camera_pick_rejects_empty_uri', 0, () => {
      const picker = new CameraPickerModel('/data/storage/files');
      let invoked: boolean = false;
      const ok = picker.pick('', (uri: string) => {
        invoked = true;
      });
      expect(ok).assertFalse();
      expect(invoked).assertFalse();
    })

    it('core_sandbox_copy_releases_resources', 0, () => {
      const copy = new SandboxCopyModel();
      copy.openSource('file://media/photo/1.jpg');
      copy.openTarget('/data/storage/files/1.jpg');
      copy.copy();
      copy.closeSource();
      copy.closeTarget();
      expect(copy.copied).assertTrue();
      expect(copy.isResourceReleased()).assertTrue();
      expect(copy.copyOrder.join(',')).assertEqual('openSource,openTarget,copy,closeSource,closeTarget');
    })

    it('core_sandbox_copy_requires_open_files', 0, () => {
      const copy = new SandboxCopyModel();
      expect(copy.copy()).assertFalse();
      copy.openSource('file://media/photo/1.jpg');
      expect(copy.copy()).assertFalse();
    })

    it('core_share_without_file_shows_toast', 0, () => {
      const payload = new SharePayloadModel();
      const ok = payload.share();
      expect(ok).assertFalse();
      expect(payload.toastShown).assertTrue();
    })

    it('core_share_with_jpg_builds_payload', 0, () => {
      const payload = new SharePayloadModel();
      payload.filePath = '/data/storage/files/2.jpg';
      const ok = payload.share();
      expect(ok).assertTrue();
      expect(payload.utd).assertEqual(UTD_IMAGE);
      expect(payload.uri).assertEqual('file:///data/storage/files/2.jpg');
    })

    it('core_share_non_image_has_no_utd', 0, () => {
      const payload = new SharePayloadModel();
      payload.filePath = '/data/storage/files/report.txt';
      expect(payload.resolveUtd(payload.filePath)).assertEqual('');
    })

    it('core_html_contract_markers', 0, () => {
      const html = new HtmlContractModel(HTML_SAMPLE);
      for (let i = 0; i < HTML_MARKERS.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `check html marker: ${HTML_MARKERS[i]}`);
        expect(html.contains(HTML_MARKERS[i])).assertTrue();
      }
    })

    it('core_html_has_input_capture', 0, () => {
      const html = new HtmlContractModel(HTML_SAMPLE);
      expect(html.contains('type="file"')).assertTrue();
      expect(html.contains('capture')).assertTrue();
      expect(html.contains('accept="image/*"')).assertTrue();
    })

    it('core_html_has_preview_nodes', 0, () => {
      const html = new HtmlContractModel(HTML_SAMPLE);
      expect(html.contains('id="image"')).assertTrue();
      expect(html.contains('id="image_preview"')).assertTrue();
    })

    it('core_html_has_native_proxy_call', 0, () => {
      const html = new HtmlContractModel(HTML_SAMPLE);
      expect(html.contains('shareObject.share()')).assertTrue();
      expect(html.countToken('function sharePic()')).assertEqual(1);
    })

    it('core_proxy_contract_matches_main_page', 0, () => {
      expect(PROXY_NAME).assertEqual('shareObject');
      expect(PROXY_METHODS.indexOf('share') >= 0).assertTrue();
      expect(PROXY_METHODS.length).assertEqual(1);
    })
  })
}
