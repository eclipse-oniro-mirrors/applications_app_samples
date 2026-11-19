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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import type common from '@ohos.app.ability.common';
import MediaUtils, { FileType } from '../../../main/ets/model/MediaUtils';
import type { MediaAssetHandle, FileInfo, AlbumInfo } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaFailureWorkflowsLogic(): void {
  describe("MediaFailureWorkflowsLogic", () => {
    let trace: MediaTrace;
    let files: FakeMediaFiles;
    let library: FakeMediaLibrary;
    let clock: FakeMediaClock;
    let context: common.UIAbilityContext;
    let media: MediaUtils;

    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
      trace = new MediaTrace();
      files = new FakeMediaFiles(trace);
      library = new FakeMediaLibrary(trace);
      clock = new FakeMediaClock(trace);
      context = mediaContext('/synthetic/media/alpha');
      media = new MediaUtils(context, files, library, clock);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1184
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1184
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1184", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1184";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=create; synthetic variant=0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-0", photoAccessHelper.PhotoType.IMAGE, "recovered-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-0";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 0", message);
      expect(message).assertEqual("synthetic create creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-0", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-0");
      LogicTestLog.value(name, "Retry native display name", "recovered-0.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-0.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1185
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1185
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1185", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1185";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=create; synthetic variant=0");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-1", photoAccessHelper.PhotoType.VIDEO, "recovered-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-1";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 0", message);
      expect(message).assertEqual("synthetic create creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-1", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-1");
      LogicTestLog.value(name, "Retry native display name", "recovered-1.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-1.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1186
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1186
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1186", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1186";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=create; synthetic variant=1");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-2", photoAccessHelper.PhotoType.IMAGE, "recovered-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-2";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 1", message);
      expect(message).assertEqual("synthetic create creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-2", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-2");
      LogicTestLog.value(name, "Retry native display name", "recovered-2.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-2.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1187
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1187
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1187", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1187";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=create; synthetic variant=1");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-3", photoAccessHelper.PhotoType.VIDEO, "recovered-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-3";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 1", message);
      expect(message).assertEqual("synthetic create creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-3", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-3");
      LogicTestLog.value(name, "Retry native display name", "recovered-3.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-3.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1188
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1188
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1188", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1188";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=fetch; synthetic variant=0");
      clock.date = "20300101";
      clock.time = "000001";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-4", photoAccessHelper.PhotoType.IMAGE, "recovered-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-4";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 0", message);
      expect(message).assertEqual("synthetic fetch creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-4", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-4");
      LogicTestLog.value(name, "Retry native display name", "recovered-4.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-4.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1189
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1189
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1189", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1189";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=fetch; synthetic variant=0");
      clock.date = "19991231";
      clock.time = "223344";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-5", photoAccessHelper.PhotoType.VIDEO, "recovered-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-5";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 0", message);
      expect(message).assertEqual("synthetic fetch creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-5", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-5");
      LogicTestLog.value(name, "Retry native display name", "recovered-5.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-5.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1190
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1190
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1190", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1190";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=fetch; synthetic variant=1");
      clock.date = "20260109";
      clock.time = "090807";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-6", photoAccessHelper.PhotoType.IMAGE, "recovered-6.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-6";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 1", message);
      expect(message).assertEqual("synthetic fetch creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-6", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-6");
      LogicTestLog.value(name, "Retry native display name", "recovered-6.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-6.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1191
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1191
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1191", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1191";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=fetch; synthetic variant=1");
      clock.date = "20261010";
      clock.time = "101010";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-7", photoAccessHelper.PhotoType.VIDEO, "recovered-7.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-7";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 1", message);
      expect(message).assertEqual("synthetic fetch creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-7", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-7");
      LogicTestLog.value(name, "Retry native display name", "recovered-7.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-7.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1192
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1192
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1192", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1192";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=all; synthetic variant=0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-8", photoAccessHelper.PhotoType.IMAGE, "recovered-8.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-8";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 0", message);
      expect(message).assertEqual("synthetic all creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-8", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-8");
      LogicTestLog.value(name, "Retry native display name", "recovered-8.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-8.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1193
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1193
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1193", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1193";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=all; synthetic variant=0");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-9", photoAccessHelper.PhotoType.VIDEO, "recovered-9.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-9";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 0", message);
      expect(message).assertEqual("synthetic all creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-9", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-9");
      LogicTestLog.value(name, "Retry native display name", "recovered-9.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-9.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1194
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1194
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1194", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1194";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=all; synthetic variant=1");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-10", photoAccessHelper.PhotoType.IMAGE, "recovered-10.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-10";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 1", message);
      expect(message).assertEqual("synthetic all creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-10", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-10");
      LogicTestLog.value(name, "Retry native display name", "recovered-10.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-10.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1195
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1195
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1195", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1195";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=all; synthetic variant=1");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-11", photoAccessHelper.PhotoType.VIDEO, "recovered-11.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-11";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 1", message);
      expect(message).assertEqual("synthetic all creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-11", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-11");
      LogicTestLog.value(name, "Retry native display name", "recovered-11.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-11.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1196
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1196
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1196", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1196";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=close; synthetic variant=0");
      clock.date = "20300101";
      clock.time = "000001";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-12", photoAccessHelper.PhotoType.IMAGE, "recovered-12.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-12";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 0", message);
      expect(message).assertEqual("synthetic close creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-12", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-12");
      LogicTestLog.value(name, "Retry native display name", "recovered-12.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-12.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1197
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1197
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1197", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1197";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=close; synthetic variant=0");
      clock.date = "19991231";
      clock.time = "223344";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-13", photoAccessHelper.PhotoType.VIDEO, "recovered-13.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-13";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 0", message);
      expect(message).assertEqual("synthetic close creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-13", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-13");
      LogicTestLog.value(name, "Retry native display name", "recovered-13.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-13.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1198
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1198
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1198", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1198";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=close; synthetic variant=1");
      clock.date = "20260109";
      clock.time = "090807";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-14", photoAccessHelper.PhotoType.IMAGE, "recovered-14.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-14";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 1", message);
      expect(message).assertEqual("synthetic close creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-14", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-14");
      LogicTestLog.value(name, "Retry native display name", "recovered-14.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-14.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1199
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1199
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1199", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1199";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=close; synthetic variant=1");
      clock.date = "20261010";
      clock.time = "101010";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-15", photoAccessHelper.PhotoType.VIDEO, "recovered-15.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-15";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 1", message);
      expect(message).assertEqual("synthetic close creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);