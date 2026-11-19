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
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Mapping has no native side effects",
        "clock.date|clock.time|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1009
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1009
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1009", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1009";
      LogicTestLog.begin(name, "mapping=3.25; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(3.25);
      const second: MediaTypeInfo = media.getInfoFromType(3.25);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(3.25);
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1010
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1010
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1010", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1010";
      LogicTestLog.begin(name, "mapping=Number.NaN; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(Number.NaN);
      const second: MediaTypeInfo = media.getInfoFromType(Number.NaN);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(Number.NaN);
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1011
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1011
     * @tc.nameDesc Mapping returns independent defaults: Verify type mapping isolation and sandbox creation after
     * modifying a returned mapping.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1011", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1011";
      LogicTestLog.begin(name, "mapping=Number.POSITIVE_INFINITY; mutate returned prefix and suffix");
      const first: MediaTypeInfo = media.getInfoFromType(Number.POSITIVE_INFINITY);
      const second: MediaTypeInfo = media.getInfoFromType(Number.POSITIVE_INFINITY);
      LogicTestLog.value(name, "Mapped prefix", "FILE_", first.prefix);
      expect(first.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapped suffix", ".txt", first.suffix);
      expect(first.suffix).assertEqual(".txt");
      LogicTestLog.flag(name, "Mapping objects are independent", first !== second);
      expect(first !== second).assertTrue();
      first.prefix = 'CHANGED_';
      first.suffix = '.invalid';
      const fresh: MediaTypeInfo = media.getInfoFromType(Number.POSITIVE_INFINITY);
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1012
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1012
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1012", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1012";
      LogicTestLog.begin(name, "FileType.AUDIO; /synthetic/media/alpha; 20261119 000000");
      clock.date = "20261119";
      clock.time = "000000";
      context = mediaContext("/synthetic/media/alpha");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      LogicTestLog.value(name, "Generated display name", "AUD_20261119_000000.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_000000.mp3");
      LogicTestLog.value(name, "Generated sandbox URI", "/synthetic/media/alpha/AUD_20261119_000000.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_000000.mp3");
      LogicTestLog.number(name, "Requested media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "AUD_20261119_000000.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_000000.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/alpha/AUD_20261119_000000.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/AUD_20261119_000000.mp3");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1013
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1013
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1013", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1013";
      LogicTestLog.begin(name, "FileType.FILE; /synthetic/media/beta; 20240229 235959");
      clock.date = "20240229";
      clock.time = "235959";
      context = mediaContext("/synthetic/media/beta");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Generated display name", "FILE_20240229_235959.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20240229_235959.txt");
      LogicTestLog.value(name, "Generated sandbox URI", "/synthetic/media/beta/FILE_20240229_235959.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/beta/FILE_20240229_235959.txt");
      LogicTestLog.number(name, "Requested media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "FILE_20240229_235959.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20240229_235959.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/beta/FILE_20240229_235959.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/beta/FILE_20240229_235959.txt");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1014
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1014
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1014", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1014";
      LogicTestLog.begin(name, "FileType.AUDIO; /synthetic/media/space folder; 20000101 010203");
      clock.date = "20000101";
      clock.time = "010203";
      context = mediaContext("/synthetic/media/space folder");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      LogicTestLog.value(name, "Generated display name", "AUD_20000101_010203.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20000101_010203.mp3");
      LogicTestLog.value(name, "Generated sandbox URI",
        "/synthetic/media/space folder/AUD_20000101_010203.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/space folder/AUD_20000101_010203.mp3");
      LogicTestLog.number(name, "Requested media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "AUD_20000101_010203.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20000101_010203.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/space folder/AUD_20000101_010203.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/space folder/AUD_20000101_010203.mp3");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1015
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1015
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1015", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1015";
      LogicTestLog.begin(name, "FileType.FILE; /synthetic/media/nested/gamma; 20261231 120000");
      clock.date = "20261231";
      clock.time = "120000";
      context = mediaContext("/synthetic/media/nested/gamma");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Generated display name", "FILE_20261231_120000.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261231_120000.txt");
      LogicTestLog.value(name, "Generated sandbox URI",
        "/synthetic/media/nested/gamma/FILE_20261231_120000.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/nested/gamma/FILE_20261231_120000.txt");
      LogicTestLog.number(name, "Requested media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "FILE_20261231_120000.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261231_120000.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/nested/gamma/FILE_20261231_120000.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/nested/gamma/FILE_20261231_120000.txt");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1016
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1016
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1016", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1016";
      LogicTestLog.begin(name, "FileType.AUDIO; /synthetic/media/alpha; 20300101 000001");
      clock.date = "20300101";
      clock.time = "000001";
      context = mediaContext("/synthetic/media/alpha");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      LogicTestLog.value(name, "Generated display name", "AUD_20300101_000001.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20300101_000001.mp3");
      LogicTestLog.value(name, "Generated sandbox URI", "/synthetic/media/alpha/AUD_20300101_000001.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20300101_000001.mp3");
      LogicTestLog.number(name, "Requested media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "AUD_20300101_000001.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20300101_000001.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/alpha/AUD_20300101_000001.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/AUD_20300101_000001.mp3");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1017
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1017
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1017", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1017";
      LogicTestLog.begin(name, "FileType.FILE; /synthetic/media/beta; 19991231 223344");
      clock.date = "19991231";
      clock.time = "223344";
      context = mediaContext("/synthetic/media/beta");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Generated display name", "FILE_19991231_223344.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_19991231_223344.txt");
      LogicTestLog.value(name, "Generated sandbox URI", "/synthetic/media/beta/FILE_19991231_223344.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/beta/FILE_19991231_223344.txt");
      LogicTestLog.number(name, "Requested media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "FILE_19991231_223344.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_19991231_223344.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/beta/FILE_19991231_223344.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/beta/FILE_19991231_223344.txt");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1018
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1018
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1018", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1018";
      LogicTestLog.begin(name, "FileType.AUDIO; /synthetic/media/space folder; 20260109 090807");
      clock.date = "20260109";
      clock.time = "090807";
      context = mediaContext("/synthetic/media/space folder");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      LogicTestLog.value(name, "Generated display name", "AUD_20260109_090807.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20260109_090807.mp3");
      LogicTestLog.value(name, "Generated sandbox URI",
        "/synthetic/media/space folder/AUD_20260109_090807.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/space folder/AUD_20260109_090807.mp3");
      LogicTestLog.number(name, "Requested media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "AUD_20260109_090807.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20260109_090807.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/space folder/AUD_20260109_090807.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/space folder/AUD_20260109_090807.mp3");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1019
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1019
     * @tc.nameDesc Sandbox asset creation is lazy: Check deterministic generated name, context snapshot, descriptor
     * flags and inert sandbox metadata.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1019", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1019";
      LogicTestLog.begin(name, "FileType.FILE; /synthetic/media/nested/gamma; 20261010 101010");
      clock.date = "20261010";
      clock.time = "101010";
      context = mediaContext("/synthetic/media/nested/gamma");
      media = new MediaUtils(context, files, library, clock);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Generated display name", "FILE_20261010_101010.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261010_101010.txt");
      LogicTestLog.value(name, "Generated sandbox URI",
        "/synthetic/media/nested/gamma/FILE_20261010_101010.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/nested/gamma/FILE_20261010_101010.txt");
      LogicTestLog.number(name, "Requested media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "Creation does not open a file", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.value(name, "Creation clock order", "clock.date|clock.time", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time");
      const metadata: photoAccessHelper.MemberType = handle.get('duration');
      handle.set('display_name', 'ignored metadata');
      await handle.commitModify();
      LogicTestLog.number(name, "Sandbox metadata default", 0, Number(metadata));
      expect(Number(metadata)).assertEqual(0);
      LogicTestLog.value(name, "Sandbox metadata does not rename", "FILE_20261010_101010.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261010_101010.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.number(name, "First descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Open count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Opened URI", "/synthetic/media/nested/gamma/FILE_20261010_101010.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/nested/gamma/FILE_20261010_101010.txt");
      LogicTestLog.number(name, "Create and read write flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Explicit close count", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.number(name, "No listing during creation", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.value(name, "Lazy handle operation order", "clock.date|clock.time|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1020
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1020
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1020", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1020";
      LogicTestLog.begin(name, "FileType.IMAGE; native result fake://media/create-0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-0", photoAccessHelper.PhotoType.IMAGE, "library-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-0";
      library.results = [fetch];
      photo.members.set('duration', 5);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-0");
      LogicTestLog.value(name, "Returned native display name", "library-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("library-0.jpg");
      LogicTestLog.number(name, "Returned media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.IMAGE, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Extension excludes dot", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-0", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-0");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 5, Number(duration));
      expect(Number(duration)).assertEqual(5);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-0", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-0");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1021
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1021
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1021", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1021";
      LogicTestLog.begin(name, "FileType.VIDEO; native result fake://media/create-1");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-1", photoAccessHelper.PhotoType.VIDEO, "library-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-1";
      library.results = [fetch];
      photo.members.set('duration', 22);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-1");
      LogicTestLog.value(name, "Returned native display name", "library-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("library-1.mp4");
      LogicTestLog.number(name, "Returned media type", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.VIDEO, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Extension excludes dot", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-1", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-1");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 22, Number(duration));
      expect(Number(duration)).assertEqual(22);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-1", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-1");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1022
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1022
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1022", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1022";
      LogicTestLog.begin(name, "FileType.IMAGE; native result fake://media/create-2");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-2", photoAccessHelper.PhotoType.IMAGE, "library-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-2";
      library.results = [fetch];
      photo.members.set('duration', 39);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-2", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-2");
      LogicTestLog.value(name, "Returned native display name", "library-2.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("library-2.jpg");
      LogicTestLog.number(name, "Returned media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.IMAGE, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Extension excludes dot", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-2", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-2");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 39, Number(duration));
      expect(Number(duration)).assertEqual(39);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-2", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-2");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1023
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1023
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1023", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1023";
      LogicTestLog.begin(name, "FileType.VIDEO; native result fake://media/create-3");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-3", photoAccessHelper.PhotoType.VIDEO, "library-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-3";
      library.results = [fetch];
      photo.members.set('duration', 56);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-3", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-3");
      LogicTestLog.value(name, "Returned native display name", "library-3.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("library-3.mp4");
      LogicTestLog.number(name, "Returned media type", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.VIDEO, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Extension excludes dot", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-3", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-3");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 56, Number(duration));
      expect(Number(duration)).assertEqual(56);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-3");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1024
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1024
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1024", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1024";
      LogicTestLog.begin(name, "FileType.IMAGE; native result fake://media/create-4");
      clock.date = "20300101";
      clock.time = "000001";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-4", photoAccessHelper.PhotoType.IMAGE, "library-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-4";
      library.results = [fetch];
      photo.members.set('duration', 73);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-4", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-4");
      LogicTestLog.value(name, "Returned native display name", "library-4.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("library-4.jpg");
      LogicTestLog.number(name, "Returned media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.IMAGE, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Extension excludes dot", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-4", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-4");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 73, Number(duration));
      expect(Number(duration)).assertEqual(73);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-4", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-4");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1025
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1025
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1025", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1025";
      LogicTestLog.begin(name, "FileType.VIDEO; native result fake://media/create-5");
      clock.date = "19991231";
      clock.time = "223344";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-5", photoAccessHelper.PhotoType.VIDEO, "library-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-5";
      library.results = [fetch];
      photo.members.set('duration', 90);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-5", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-5");
      LogicTestLog.value(name, "Returned native display name", "library-5.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("library-5.mp4");
      LogicTestLog.number(name, "Returned media type", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.VIDEO, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Extension excludes dot", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-5", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-5");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 90, Number(duration));
      expect(Number(duration)).assertEqual(90);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-5", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-5");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1026
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1026
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1026", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1026";
      LogicTestLog.begin(name, "FileType.IMAGE; native result fake://media/create-6");
      clock.date = "20260109";
      clock.time = "090807";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-6", photoAccessHelper.PhotoType.IMAGE, "library-6.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-6";
      library.results = [fetch];
      photo.members.set('duration', 107);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-6", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-6");
      LogicTestLog.value(name, "Returned native display name", "library-6.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("library-6.jpg");
      LogicTestLog.number(name, "Returned media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.IMAGE, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Extension excludes dot", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-6", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-6");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 107, Number(duration));
      expect(Number(duration)).assertEqual(107);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-6", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-6");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1027
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1027
     * @tc.nameDesc Photo creation uses native returned metadata: Verify native type and extension, fetch columns,
     * close-before-handle ordering and library display name.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1027", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1027";
      LogicTestLog.begin(name, "FileType.VIDEO; native result fake://media/create-7");
      clock.date = "20261010";
      clock.time = "101010";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-7", photoAccessHelper.PhotoType.VIDEO, "library-7.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-7";
      library.results = [fetch];
      photo.members.set('duration', 124);
      const predicates: FakeMediaPredicates = new FakeMediaPredicates();
      media = new MediaUtils(context, files, library, clock, () => predicates);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Returned native URI", "fake://media/create-7", handle.uri);
      expect(handle.uri).assertEqual("fake://media/create-7");
      LogicTestLog.value(name, "Returned native display name", "library-7.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("library-7.mp4");
      LogicTestLog.number(name, "Returned media type", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "One create request", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native photo type", photoAccessHelper.PhotoType.VIDEO, library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Extension excludes dot", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "One fetch request", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "URI predicate supplied", library.fetches[0].predicates === predicates);
      expect(library.fetches[0].predicates === predicates).assertTrue();
      LogicTestLog.number(name, "Exactly one URI equality", 1, predicates.equalities.length);
      expect(predicates.equalities.length).assertEqual(1);
      LogicTestLog.value(name, "URI equality field", "uri", predicates.equalities[0].field);
      expect(predicates.equalities[0].field).assertEqual("uri");
      LogicTestLog.value(name, "URI equality value", "fake://media/create-7", String(predicates.equalities[0].value));
      expect(String(predicates.equalities[0].value)).assertEqual("fake://media/create-7");
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Fetch closes before display metadata read",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get");
      const duration: photoAccessHelper.MemberType = handle.get('duration');
      LogicTestLog.number(name, "Native duration forwarded", 124, Number(duration));
      expect(Number(duration)).assertEqual(124);
      const fd: number = await handle.open('r');
      await handle.close(fd);
      LogicTestLog.number(name, "Photo descriptor", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Photo open path", "fake://media/create-7", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/create-7");
      LogicTestLog.number(name, "Photo open keeps existing read write mode", fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Photo descriptor close", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Creation does not mutate metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1028
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1028
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1028", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1028";
      LogicTestLog.begin(name, "createFile FileType.IMAGE; alternate context /synthetic/media/alpha");
      clock.date = "20261119";
      clock.time = "000000";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      const descriptor: fileIo.File | null = await media.createFile(FileType.IMAGE, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path", "/synthetic/media/alpha/IMG_20261119_000000.jpg",
        descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/alpha/IMG_20261119_000000.jpg");
      LogicTestLog.value(name, "Returned descriptor name", "IMG_20261119_000000.jpg", descriptor.name);
      expect(descriptor.name).assertEqual("IMG_20261119_000000.jpg");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/alpha", parent);
      expect(parent).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used", "/synthetic/media/alpha/IMG_20261119_000000.jpg",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/IMG_20261119_000000.jpg");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1029
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1029
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1029", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1029";
      LogicTestLog.begin(name, "createFile FileType.VIDEO; alternate context /synthetic/media/beta");
      clock.date = "20240229";
      clock.time = "235959";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/beta");
      const descriptor: fileIo.File | null = await media.createFile(FileType.VIDEO, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path", "/synthetic/media/beta/VID_20240229_235959.mp4",
        descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/beta/VID_20240229_235959.mp4");
      LogicTestLog.value(name, "Returned descriptor name", "VID_20240229_235959.mp4", descriptor.name);
      expect(descriptor.name).assertEqual("VID_20240229_235959.mp4");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/beta", parent);
      expect(parent).assertEqual("/synthetic/media/beta");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used", "/synthetic/media/beta/VID_20240229_235959.mp4",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/beta/VID_20240229_235959.mp4");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1030
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1030
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1030", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1030";
      LogicTestLog.begin(name, "createFile FileType.AUDIO; alternate context /synthetic/media/space folder");
      clock.date = "20000101";
      clock.time = "010203";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/space folder");
      const descriptor: fileIo.File | null = await media.createFile(FileType.AUDIO, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path",
        "/synthetic/media/space folder/AUD_20000101_010203.mp3", descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/space folder/AUD_20000101_010203.mp3");
      LogicTestLog.value(name, "Returned descriptor name", "AUD_20000101_010203.mp3", descriptor.name);
      expect(descriptor.name).assertEqual("AUD_20000101_010203.mp3");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/space folder", parent);
      expect(parent).assertEqual("/synthetic/media/space folder");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used",
        "/synthetic/media/space folder/AUD_20000101_010203.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/space folder/AUD_20000101_010203.mp3");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1031
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1031
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1031", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1031";
      LogicTestLog.begin(name, "createFile FileType.FILE; alternate context /synthetic/media/nested/gamma");
      clock.date = "20261231";
      clock.time = "120000";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/nested/gamma");
      const descriptor: fileIo.File | null = await media.createFile(FileType.FILE, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path",
        "/synthetic/media/nested/gamma/FILE_20261231_120000.txt", descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/nested/gamma/FILE_20261231_120000.txt");
      LogicTestLog.value(name, "Returned descriptor name", "FILE_20261231_120000.txt", descriptor.name);
      expect(descriptor.name).assertEqual("FILE_20261231_120000.txt");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/nested/gamma", parent);
      expect(parent).assertEqual("/synthetic/media/nested/gamma");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used",
        "/synthetic/media/nested/gamma/FILE_20261231_120000.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/nested/gamma/FILE_20261231_120000.txt");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1032
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1032
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1032", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1032";
      LogicTestLog.begin(name, "createFile FileType.IMAGE; alternate context /synthetic/media/alpha");
      clock.date = "20300101";
      clock.time = "000001";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      const descriptor: fileIo.File | null = await media.createFile(FileType.IMAGE, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path", "/synthetic/media/alpha/IMG_20300101_000001.jpg",
        descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/alpha/IMG_20300101_000001.jpg");
      LogicTestLog.value(name, "Returned descriptor name", "IMG_20300101_000001.jpg", descriptor.name);
      expect(descriptor.name).assertEqual("IMG_20300101_000001.jpg");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/alpha", parent);
      expect(parent).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used", "/synthetic/media/alpha/IMG_20300101_000001.jpg",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/IMG_20300101_000001.jpg");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1033
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1033
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1033", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1033";
      LogicTestLog.begin(name, "createFile FileType.VIDEO; alternate context /synthetic/media/beta");
      clock.date = "19991231";
      clock.time = "223344";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/beta");
      const descriptor: fileIo.File | null = await media.createFile(FileType.VIDEO, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path", "/synthetic/media/beta/VID_19991231_223344.mp4",
        descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/beta/VID_19991231_223344.mp4");
      LogicTestLog.value(name, "Returned descriptor name", "VID_19991231_223344.mp4", descriptor.name);
      expect(descriptor.name).assertEqual("VID_19991231_223344.mp4");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/beta", parent);
      expect(parent).assertEqual("/synthetic/media/beta");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used", "/synthetic/media/beta/VID_19991231_223344.mp4",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/beta/VID_19991231_223344.mp4");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1034
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1034
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1034", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1034";
      LogicTestLog.begin(name, "createFile FileType.AUDIO; alternate context /synthetic/media/space folder");
      clock.date = "20260109";
      clock.time = "090807";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/space folder");
      const descriptor: fileIo.File | null = await media.createFile(FileType.AUDIO, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path",
        "/synthetic/media/space folder/AUD_20260109_090807.mp3", descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/space folder/AUD_20260109_090807.mp3");
      LogicTestLog.value(name, "Returned descriptor name", "AUD_20260109_090807.mp3", descriptor.name);
      expect(descriptor.name).assertEqual("AUD_20260109_090807.mp3");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/space folder", parent);
      expect(parent).assertEqual("/synthetic/media/space folder");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used",
        "/synthetic/media/space folder/AUD_20260109_090807.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/space folder/AUD_20260109_090807.mp3");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1035
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1035
     * @tc.nameDesc createFile returns a usable native shaped descriptor: Check explicit context path, generated file
     * type, descriptor parent and injected lock operations.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1035", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1035";
      LogicTestLog.begin(name, "createFile FileType.FILE; alternate context /synthetic/media/nested/gamma");
      clock.date = "20261010";
      clock.time = "101010";
      const alternate: common.UIAbilityContext = mediaContext("/synthetic/media/nested/gamma");
      const descriptor: fileIo.File | null = await media.createFile(FileType.FILE, alternate);
      LogicTestLog.flag(name, "Descriptor is not null", descriptor !== null);
      expect(descriptor !== null).assertTrue();
      if (descriptor === null) {
        throw new Error('Expected a fake descriptor');
      }
      LogicTestLog.number(name, "Returned descriptor fd", 710, descriptor.fd);
      expect(descriptor.fd).assertEqual(710);
      LogicTestLog.value(name, "Returned descriptor path",
        "/synthetic/media/nested/gamma/FILE_20261010_101010.txt", descriptor.path);
      expect(descriptor.path).assertEqual("/synthetic/media/nested/gamma/FILE_20261010_101010.txt");
      LogicTestLog.value(name, "Returned descriptor name", "FILE_20261010_101010.txt", descriptor.name);
      expect(descriptor.name).assertEqual("FILE_20261010_101010.txt");
      const parent: string = descriptor.getParent();
      await descriptor.lock(true);
      descriptor.unlock();
      LogicTestLog.value(name, "Descriptor parent", "/synthetic/media/nested/gamma", parent);
      expect(parent).assertEqual("/synthetic/media/nested/gamma");
      LogicTestLog.number(name, "Open request count", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Explicit context is used",
        "/synthetic/media/nested/gamma/FILE_20261010_101010.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/nested/gamma/FILE_20261010_101010.txt");
      LogicTestLog.number(name, "File creation flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.flag(name, "Descriptor identity is preserved", descriptor === files.descriptors[0]);
      expect(descriptor === files.descriptors[0]).assertTrue();
      LogicTestLog.number(name, "No automatic close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
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
      LogicTestLog.value(name, "Descriptor lock operation order",
        "clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|descriptor.parent|descripto" +
        "r.lock:true|descriptor.unlock");
      let callbackCount: number = 0;
      let callbackFailed: boolean = false;
      descriptor.lock((error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Shared lock callback is asynchronous", 0, callbackCount);
      expect(callbackCount).assertEqual(0);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Shared lock callback completes once", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      LogicTestLog.flag(name, "Shared lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.lock(true, (error: BusinessError): void => {
        callbackCount++;
        callbackFailed = error !== undefined;
      });
      LogicTestLog.number(name, "Exclusive lock callback is asynchronous", 1, callbackCount);
      expect(callbackCount).assertEqual(1);
      await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 1); });
      LogicTestLog.number(name, "Exclusive lock callback completes once", 2, callbackCount);
      expect(callbackCount).assertEqual(2);
      LogicTestLog.flag(name, "Exclusive lock callback succeeds", callbackFailed);
      expect(callbackFailed).assertFalse();
      descriptor.unlock();
      files.closeSync(descriptor.fd);
      LogicTestLog.number(name, "Caller can close returned fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1036
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1036
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1036", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1036";
      LogicTestLog.begin(name, "invalid media type 0");
      let message: string = '';
      try {
        await media.createAndGetUri(0);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 0", message);
      expect(message).assertEqual("Unsupported create media type: 0");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(0, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 0", message);
      expect(message).assertEqual("Unsupported create media type: 0");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(0);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1037
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1037
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1037", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1037";
      LogicTestLog.begin(name, "invalid media type -1");
      let message: string = '';
      try {
        await media.createAndGetUri(-1);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: -1", message);
      expect(message).assertEqual("Unsupported create media type: -1");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(-1, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: -1", message);
      expect(message).assertEqual("Unsupported create media type: -1");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(-1);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1038
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1038
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1038", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1038";
      LogicTestLog.begin(name, "invalid media type 5");
      let message: string = '';
      try {
        await media.createAndGetUri(5);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 5", message);
      expect(message).assertEqual("Unsupported create media type: 5");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(5, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 5", message);
      expect(message).assertEqual("Unsupported create media type: 5");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(5);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1039
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1039
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1039", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1039";
      LogicTestLog.begin(name, "invalid media type 99");
      let message: string = '';
      try {
        await media.createAndGetUri(99);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 99", message);
      expect(message).assertEqual("Unsupported create media type: 99");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(99, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 99", message);
      expect(message).assertEqual("Unsupported create media type: 99");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(99);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1040
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1040
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1040", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1040";
      LogicTestLog.begin(name, "invalid media type 1.5");
      let message: string = '';
      try {
        await media.createAndGetUri(1.5);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 1.5", message);
      expect(message).assertEqual("Unsupported create media type: 1.5");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(1.5, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 1.5", message);
      expect(message).assertEqual("Unsupported create media type: 1.5");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(1.5);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1041
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1041
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1041", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1041";
      LogicTestLog.begin(name, "invalid media type 3.25");
      let message: string = '';
      try {
        await media.createAndGetUri(3.25);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 3.25", message);
      expect(message).assertEqual("Unsupported create media type: 3.25");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(3.25, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 3.25", message);
      expect(message).assertEqual("Unsupported create media type: 3.25");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(3.25);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1042
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1042
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1042", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1042";
      LogicTestLog.begin(name, "invalid media type NaN");
      let message: string = '';
      try {
        await media.createAndGetUri(Number.NaN);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: NaN", message);
      expect(message).assertEqual("Unsupported create media type: NaN");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(Number.NaN, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: NaN", message);
      expect(message).assertEqual("Unsupported create media type: NaN");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(Number.NaN);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1043
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1043
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1043", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1043";
      LogicTestLog.begin(name, "invalid media type Infinity");
      let message: string = '';
      try {
        await media.createAndGetUri(Number.POSITIVE_INFINITY);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: Infinity", message);
      expect(message).assertEqual("Unsupported create media type: Infinity");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(Number.POSITIVE_INFINITY, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: Infinity", message);
      expect(message).assertEqual("Unsupported create media type: Infinity");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(Number.POSITIVE_INFINITY);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1044
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1044
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1044", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1044";
      LogicTestLog.begin(name, "invalid media type -Infinity");
      let message: string = '';
      try {
        await media.createAndGetUri(Number.NEGATIVE_INFINITY);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: -Infinity", message);
      expect(message).assertEqual("Unsupported create media type: -Infinity");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(Number.NEGATIVE_INFINITY, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: -Infinity", message);
      expect(message).assertEqual("Unsupported create media type: -Infinity");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(Number.NEGATIVE_INFINITY);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1045
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1045
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1045", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1045";
      LogicTestLog.begin(name, "invalid media type 9007199254740991");
      let message: string = '';
      try {
        await media.createAndGetUri(Number.MAX_SAFE_INTEGER);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 9007199254740991", message);
      expect(message).assertEqual("Unsupported create media type: 9007199254740991");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(Number.MAX_SAFE_INTEGER, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 9007199254740991", message);
      expect(message).assertEqual("Unsupported create media type: 9007199254740991");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(Number.MAX_SAFE_INTEGER);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1046
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1046
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1046", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1046";
      LogicTestLog.begin(name, "invalid media type -2147483648");
      let message: string = '';
      try {
        await media.createAndGetUri(-2147483648);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: -2147483648", message);
      expect(message).assertEqual("Unsupported create media type: -2147483648");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(-2147483648, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: -2147483648", message);
      expect(message).assertEqual("Unsupported create media type: -2147483648");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(-2147483648);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1047
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1047
     * @tc.nameDesc Unsupported create types fail before clock or native work: Check both create APIs reject unsupported
     * numeric values without accidentally creating video text assets.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1047", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1047";
      LogicTestLog.begin(name, "invalid media type 0.0001");
      let message: string = '';
      try {
        await media.createAndGetUri(0.0001);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createAndGetUri rejection", "Unsupported create media type: 0.0001", message);
      expect(message).assertEqual("Unsupported create media type: 0.0001");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Rejected type produces no operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      message = '';
      try {
        await media.createFile(0.0001, context);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "createFile rejection", "Unsupported create media type: 0.0001", message);
      expect(message).assertEqual("Unsupported create media type: 0.0001");
      LogicTestLog.number(name, "Still no descriptors", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Still no open request", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Still no native create", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      const fallback: MediaTypeInfo = media.getInfoFromType(0.0001);
      LogicTestLog.value(name, "Mapping default remains compatible", "FILE_", fallback.prefix);
      expect(fallback.prefix).assertEqual("FILE_");
      LogicTestLog.value(name, "Mapping default extension remains compatible", ".txt", fallback.suffix);
      expect(fallback.suffix).assertEqual(".txt");
      LogicTestLog.value(name, "Mapping fallback is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });
  });
}
