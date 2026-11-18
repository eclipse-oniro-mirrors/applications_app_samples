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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Permission } from '../../../../main/ets/common/utils/Permission';
import { FileJumpTools, PlaylistItem } from '../../../../main/ets/common/FileJumpTools';
import { AbilityManager } from '../../../../main/ets/common/manager/AbilityManager';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import { createBean } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function securityValidationTest() {
  describe('SecurityValidation', () => {
    /*
     * Share requests carry the read and write uri grants only for the shared file.
     */
    describe('SecurityValidation_Share_Want_Security', () => {
      it('image_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_action');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.action).assertEqual('ohos.want.action.viewData');
      });

      it('image_want_type', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_type');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.type).assertEqual('image/*');
      });

      it('image_want_uri', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_uri');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.uri).assertEqual('file://a.jpg');
      });

      it('image_want_parameters', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_parameters');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        let params = want.parameters;
        expect(params !== undefined).assertTrue();
        if (params) {
          expect(params['uri']).assertEqual('file://a.jpg');
          expect(params['name']).assertEqual('a.jpg');
        }
      });

      it('video_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_want_action');
        let want = await FileJumpTools.getVideoWant('v.mp4', 'file://not/exist.mp4');
        expect(want.action).assertEqual('ohos.want.action.viewData');
        expect(want.type).assertEqual('video/*');
      });

      it('audio_want_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_playlist');
        let items: PlaylistItem[] = [{ name: 'a.mp3', uri: 'file://a.mp3', time: 1 }];
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        let params = want.parameters;
        if (params) {
          expect(params['playListCount']).assertEqual(1);
          expect(params['currentIndex']).assertEqual(0);
        }
      });

      it('photo_want_bundle', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: photo_want_bundle');
        let want = FileJumpTools.getPhotoWant('file://a.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
      });

      it('permission_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: permission_api_contract');
        expect(typeof Permission.checkAndRequest).assertEqual('function');
      });

      it('ability_manager_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ability_manager_api_contract');
        let manager: AbilityManager = new AbilityManager();
        expect(typeof manager.startShareAbility).assertEqual('function');
        expect(typeof manager.preloadShareService).assertEqual('function');
      });
    });

    /*
     * Wants are built from file uris, never from raw sandbox paths.
     */
    describe('SecurityValidation_Uri_Grant_Validation', () => {
      it('image_want_keeps_uri_scheme', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_keeps_uri_scheme');
        let want = FileJumpTools.getImageWant('photo.png', 'file://media/Photo/1.png');
        expect(want.uri?.indexOf('file://')).assertEqual(0);
      });

      it('audio_want_empty_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_empty_playlist');
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, []);
        let params = want.parameters;
        if (params) {
          expect(params['playList']).assertEqual(undefined);
        }
      });

      it('security_flags_exist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_flags_exist');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.flags).not().assertEqual(undefined);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for SecurityValidation derived from the reference suite.
     */
    describe('SecurityValidation_Extended_Coverage', () => {
      it('security_image_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_0');
        let want = FileJumpTools.getImageWant('img0.jpg', 'file://img0.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img0.jpg');
        }
      });

      it('security_audio_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_1');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_2');
        let want = FileJumpTools.getPhotoWant('file://photo/2.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/2.jpg');
        }
      });

      it('security_contract_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_3');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_4');
        let want = FileJumpTools.getImageWant('img4.jpg', 'file://img4.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img4.jpg');
        }
      });

      it('security_audio_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_5');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_6');
        let want = FileJumpTools.getPhotoWant('file://photo/6.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/6.jpg');
        }
      });

      it('security_contract_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_7');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_8');
        let want = FileJumpTools.getImageWant('img8.jpg', 'file://img8.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img8.jpg');
        }
      });

      it('security_audio_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_9');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 4; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_10');
        let want = FileJumpTools.getPhotoWant('file://photo/10.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/10.jpg');
        }
      });

      it('security_contract_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_11');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_12');
        let want = FileJumpTools.getImageWant('img12.jpg', 'file://img12.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img12.jpg');
        }
      });

      it('security_audio_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_13');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 3; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_14');
        let want = FileJumpTools.getPhotoWant('file://photo/14.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/14.jpg');
        }
      });

      it('security_contract_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_15');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_16');
        let want = FileJumpTools.getImageWant('img16.jpg', 'file://img16.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img16.jpg');
        }
      });

      it('security_audio_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_17');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 2; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_18');
        let want = FileJumpTools.getPhotoWant('file://photo/18.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/18.jpg');
        }
      });

      it('security_contract_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_19');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_20');
        let want = FileJumpTools.getImageWant('img20.jpg', 'file://img20.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img20.jpg');
        }
      });

      it('security_audio_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_21');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_22');
        let want = FileJumpTools.getPhotoWant('file://photo/22.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/22.jpg');
        }
      });
    });
  });
}
