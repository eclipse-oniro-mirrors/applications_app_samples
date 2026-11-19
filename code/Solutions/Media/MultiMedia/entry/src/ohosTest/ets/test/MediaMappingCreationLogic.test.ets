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
import type { BusinessError } from '@kit.BasicServicesKit';
import MediaUtils, { FileType } from '../../../main/ets/model/MediaUtils';
import type { MediaAssetHandle, MediaTypeInfo } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary,
    FakeMediaPredicates, mediaContext
} from '../utils/MediaFakes';

export default function MediaMappingCreationLogic(): void {
  describe("MediaMappingCreationLogic", () => {
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1000
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1000
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1000", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1000";
      LogicTestLog.begin(name, "mapping=FileType.IMAGE; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(FileType.IMAGE);
      const second: MediaTypeInfo = media.getInfoFromType(FileType.IMAGE);
      LogicTestLog.value(name, "Mapped prefix", "IMG_", first.prefix);
      expect(first.prefix).assertEqual("IMG_");
      LogicTestLog.value(name, "Mapped suffix", ".jpg", first.suffix);
      expect(first.suffix).assertEqual(".jpg");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(FileType.IMAGE);
      LogicTestLog.value(name, "Original prefix is stable", "IMG_", second.prefix);
      expect(second.prefix).assertEqual("IMG_");
      LogicTestLog.value(name, "Original suffix is stable", ".jpg", second.suffix);
      expect(second.suffix).assertEqual(".jpg");
      LogicTestLog.value(name, "Fresh prefix is stable", "IMG_", fresh.prefix);
      expect(fresh.prefix).assertEqual("IMG_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".jpg", fresh.suffix);
      expect(fresh.suffix).assertEqual(".jpg");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1001
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1001
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1001", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1001";
      LogicTestLog.begin(name, "mapping=FileType.VIDEO; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(FileType.VIDEO);
      const second: MediaTypeInfo = media.getInfoFromType(FileType.VIDEO);
      LogicTestLog.value(name, "Mapped prefix", "VID_", first.prefix);
      expect(first.prefix).assertEqual("VID_");
      LogicTestLog.value(name, "Mapped suffix", ".mp4", first.suffix);
      expect(first.suffix).assertEqual(".mp4");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(FileType.VIDEO);
      LogicTestLog.value(name, "Original prefix is stable", "VID_", second.prefix);
      expect(second.prefix).assertEqual("VID_");
      LogicTestLog.value(name, "Original suffix is stable", ".mp4", second.suffix);
      expect(second.suffix).assertEqual(".mp4");
      LogicTestLog.value(name, "Fresh prefix is stable", "VID_", fresh.prefix);
      expect(fresh.prefix).assertEqual("VID_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".mp4", fresh.suffix);
      expect(fresh.suffix).assertEqual(".mp4");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1002
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1002
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1002", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1002";
      LogicTestLog.begin(name, "mapping=FileType.AUDIO; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(FileType.AUDIO);
      const second: MediaTypeInfo = media.getInfoFromType(FileType.AUDIO);
      LogicTestLog.value(name, "Mapped prefix", "AUD_", first.prefix);
      expect(first.prefix).assertEqual("AUD_");
      LogicTestLog.value(name, "Mapped suffix", ".mp3", first.suffix);
      expect(first.suffix).assertEqual(".mp3");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(FileType.AUDIO);
      LogicTestLog.value(name, "Original prefix is stable", "AUD_", second.prefix);
      expect(second.prefix).assertEqual("AUD_");
      LogicTestLog.value(name, "Original suffix is stable", ".mp3", second.suffix);
      expect(second.suffix).assertEqual(".mp3");
      LogicTestLog.value(name, "Fresh prefix is stable", "AUD_", fresh.prefix);
      expect(fresh.prefix).assertEqual("AUD_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".mp3", fresh.suffix);
      expect(fresh.suffix).assertEqual(".mp3");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1003
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1003
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1003", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1003";
      LogicTestLog.begin(name, "mapping=FileType.FILE; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(FileType.FILE);
      const second: MediaTypeInfo = media.getInfoFromType(FileType.FILE);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(FileType.FILE);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1004
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1004
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1004", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1004";
      LogicTestLog.begin(name, "mapping=0; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(0);
      const second: MediaTypeInfo = media.getInfoFromType(0);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(0);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1005
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1005
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1005", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1005";
      LogicTestLog.begin(name, "mapping=-1; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(-1);
      const second: MediaTypeInfo = media.getInfoFromType(-1);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(-1);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1006
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1006
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1006", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1006";
      LogicTestLog.begin(name, "mapping=5; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(5);
      const second: MediaTypeInfo = media.getInfoFromType(5);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(5);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1007
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1007
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1007", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1007";
      LogicTestLog.begin(name, "mapping=99; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(99);
      const second: MediaTypeInfo = media.getInfoFromType(99);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(99);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1008
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1008
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1008", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1008";
      LogicTestLog.begin(name, "mapping=1.5; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(1.5);
      const second: MediaTypeInfo = media.getInfoFromType(1.5);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(1.5);
      LogicTestLog.value(name, "Original prefix is stable", "FILE_", second.prefix);
      expect(second.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Original suffix is stable", ".txt", second.suffix);
      expect(second.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Fresh prefix is stable", "FILE_", fresh.prefix);
      expect(fresh.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Fresh suffix is stable", ".txt", fresh.suffix);
      expect(fresh.suffix).assertEqual(".txt");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Creation still uses text mapping", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Sandbox URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Created handle type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "Descriptor uses injected file operations", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Closed descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Opened generated path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Sandbox open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);