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
import type { MediaAssetHandle } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaRenameMetadataLogic(): void {
  describe("MediaRenameMetadataLogic", () => {
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1140
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1140
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1140", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1140";
      LogicTestLog.begin(name, "alpha.txt -> beta");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 501);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 501,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.txt"))).assertEqual(501);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1141
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1141
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1141", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1141";
      LogicTestLog.begin(name, "alpha.txt -> beta.txt");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 502);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta.txt");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 502,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.txt"))).assertEqual(502);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1142
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1142
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1142", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1142";
      LogicTestLog.begin(name, "alpha.txt -> beta.TXT");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 503);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta.TXT");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.TXT.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.TXT.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.TXT.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.TXT.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.TXT.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.TXT.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 503,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.TXT.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.TXT.txt"))).assertEqual(503);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.TXT.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1143
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1143
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1143", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1143";
      LogicTestLog.begin(name, "report.v2.txt -> final.v3");
      files.names = ["report.v2.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/report.v2.txt", 504);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("final.v3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/report.v2.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/report.v2.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/final.v3.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/final.v3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "final.v3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("final.v3.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change",
        "/synthetic/media/alpha/report.v2.txt", snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/report.v2.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "report.v2.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("report.v2.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "final.v3.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("final.v3.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 504,
        Number(files.mtimes.get("/synthetic/media/alpha/final.v3.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/final.v3.txt"))).assertEqual(504);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/final.v3.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1144
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1144
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1144", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1144";
      LogicTestLog.begin(name, "tone.mp3 -> next.mp3");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 505);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("next.mp3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/next.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/next.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "next.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("next.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "next.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("next.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 505,
        Number(files.mtimes.get("/synthetic/media/alpha/next.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/next.mp3"))).assertEqual(505);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/next.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1145
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1145
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1145", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1145";
      LogicTestLog.begin(name, "tone.mp3 -> next");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 506);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("next");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/next.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/next.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "next.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("next.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "next.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("next.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 506,
        Number(files.mtimes.get("/synthetic/media/alpha/next.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/next.mp3"))).assertEqual(506);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/next.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1146
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1146
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1146", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1146";
      LogicTestLog.begin(name, "mix.v2.mp3 -> mix.v3.mp3");
      files.names = ["mix.v2.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/mix.v2.mp3", 507);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("mix.v3.mp3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/mix.v2.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/mix.v2.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/mix.v3.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/mix.v3.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "mix.v3.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("mix.v3.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change",
        "/synthetic/media/alpha/mix.v2.mp3", snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/mix.v2.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "mix.v2.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("mix.v2.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "mix.v3.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("mix.v3.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 507,
        Number(files.mtimes.get("/synthetic/media/alpha/mix.v3.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/mix.v3.mp3"))).assertEqual(507);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/mix.v3.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1147
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1147
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1147", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1147";
      LogicTestLog.begin(name, "tone.mp3 -> sound.wav");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 508);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("sound.wav");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/sound.wav.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/sound.wav.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "sound.wav.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("sound.wav.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "sound.wav.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("sound.wav.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 508,
        Number(files.mtimes.get("/synthetic/media/alpha/sound.wav.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/sound.wav.mp3"))).assertEqual(508);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/sound.wav.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1148
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1148
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1148", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1148";
      LogicTestLog.begin(name, ".txt -> hidden");
      files.names = [".txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/.txt", 509);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("hidden");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/.txt", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/hidden",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/hidden", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed display name updates after success", "hidden", handle.displayName);
      expect(handle.displayName).assertEqual("hidden");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", ".txt", snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual(".txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "hidden|untouched.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("hidden|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 509,
        Number(files.mtimes.get("/synthetic/media/alpha/hidden")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/hidden"))).assertEqual(509);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/hidden",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1149
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1149
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1149", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1149";
      LogicTestLog.begin(name, ".mp3 -> hidden");
      files.names = [".mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/.mp3", 510);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("hidden");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/.mp3", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/hidden",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/hidden", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed display name updates after success", "hidden", handle.displayName);
      expect(handle.displayName).assertEqual("hidden");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", ".mp3", snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual(".mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "hidden|untouched.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("hidden|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 510,
        Number(files.mtimes.get("/synthetic/media/alpha/hidden")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/hidden"))).assertEqual(510);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/hidden",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1150
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1150
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1150", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1150";
      LogicTestLog.begin(name, "alpha.txt -> synthetic note");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 511);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("synthetic note");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule",
        "/synthetic/media/alpha/synthetic note.txt", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/synthetic note.txt");
      LogicTestLog.value(name, "Exposed URI updates after success",
        "/synthetic/media/alpha/synthetic note.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/synthetic note.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "synthetic note.txt", handle.displayName);
      expect(handle.displayName).assertEqual("synthetic note.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "synthetic note.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("synthetic note.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 511,
        Number(files.mtimes.get("/synthetic/media/alpha/synthetic note.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/synthetic note.txt"))).assertEqual(511);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI",
        "/synthetic/media/alpha/synthetic note.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/synthetic note.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1151
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1151
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1151", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1151";
      LogicTestLog.begin(name, "tone.mp3 -> synthetic tone");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 512);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("synthetic tone");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule",
        "/synthetic/media/alpha/synthetic tone.mp3", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/synthetic tone.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success",
        "/synthetic/media/alpha/synthetic tone.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/synthetic tone.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "synthetic tone.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("synthetic tone.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "synthetic tone.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("synthetic tone.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 512,
        Number(files.mtimes.get("/synthetic/media/alpha/synthetic tone.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/synthetic tone.mp3"))).assertEqual(512);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI",
        "/synthetic/media/alpha/synthetic tone.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/synthetic tone.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1152
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1152
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1152", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1152";
      LogicTestLog.begin(name, "alpha.txt -> .hidden");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 513);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename(".hidden");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/.hidden.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/.hidden.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/.hidden.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/.hidden.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", ".hidden.txt", handle.displayName);
      expect(handle.displayName).assertEqual(".hidden.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", ".hidden.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual(".hidden.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 513,
        Number(files.mtimes.get("/synthetic/media/alpha/.hidden.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/.hidden.txt"))).assertEqual(513);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/.hidden.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/.hidden.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1153
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1153
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1153", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1153";
      LogicTestLog.begin(name, "tone.mp3 -> ..safe");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 514);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("..safe");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/..safe.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/..safe.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/..safe.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/..safe.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "..safe.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("..safe.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "..safe.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("..safe.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 514,
        Number(files.mtimes.get("/synthetic/media/alpha/..safe.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/..safe.mp3"))).assertEqual(514);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/..safe.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/..safe.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1154
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1154
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1154", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1154";
      LogicTestLog.begin(name, "alpha.txt -> alpha.txt");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 515);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("alpha.txt");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/alpha.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "alpha.txt", handle.displayName);
      expect(handle.displayName).assertEqual("alpha.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "alpha.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("alpha.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 515,
        Number(files.mtimes.get("/synthetic/media/alpha/alpha.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/alpha.txt"))).assertEqual(515);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/alpha.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1155
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1155
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1155", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1155";
      LogicTestLog.begin(name, "tone.mp3 -> suffix.");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 516);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("suffix.");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/suffix..mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/suffix..mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/suffix..mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/suffix..mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "suffix..mp3", handle.displayName);
      expect(handle.displayName).assertEqual("suffix..mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "suffix..mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("suffix..mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 516,
        Number(files.mtimes.get("/synthetic/media/alpha/suffix..mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/suffix..mp3"))).assertEqual(516);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/suffix..mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/suffix..mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1156
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1156
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1156", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1156";
      LogicTestLog.begin(name, "unsafe name \"\"; type=FileType.AUDIO");
      files.names = ["protected-0.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-0.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-0.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-0.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-0.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-0.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-0.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-0.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-0.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-0.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-0.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-0.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-0.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-0.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-0.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-0.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-0.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-0.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-0.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1157
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1157
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1157", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1157";
      LogicTestLog.begin(name, "unsafe name \".\"; type=FileType.FILE");
      files.names = ["protected-1.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-1.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename(".");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-1.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-1.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-1.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-1.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-1.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-1.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-1.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-1.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-1.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-1.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-1.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-1.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-1.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-1.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-1.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-1.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-1.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1158
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1158
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1158", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1158";
      LogicTestLog.begin(name, "unsafe name \"..\"; type=FileType.AUDIO");
      files.names = ["protected-2.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-2.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("..");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-2.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-2.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-2.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-2.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-2.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-2.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-2.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-2.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-2.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-2.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-2.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-2.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-2.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-2.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-2.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-2.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-2.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1159
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1159
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1159", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1159";
      LogicTestLog.begin(name, "unsafe name \"../escape\"; type=FileType.FILE");
      files.names = ["protected-3.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-3.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("../escape");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-3.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-3.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-3.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-3.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-3.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-3.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-3.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-3.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-3.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-3.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-3.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-3.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-3.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1160
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1160
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1160", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1160";
      LogicTestLog.begin(name, "unsafe name \"folder/name\"; type=FileType.AUDIO");
      files.names = ["protected-4.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-4.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("folder/name");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-4.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-4.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-4.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-4.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-4.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-4.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-4.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-4.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-4.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-4.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-4.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-4.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-4.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-4.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-4.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-4.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-4.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1161
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1161
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1161", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1161";
      LogicTestLog.begin(name, "unsafe name \"folder\\\\name\"; type=FileType.FILE");
      files.names = ["protected-5.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-5.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("folder\\name");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-5.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-5.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-5.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-5.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-5.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-5.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-5.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-5.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-5.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-5.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-5.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-5.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-5.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-5.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-5.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-5.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-5.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1162
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1162
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1162", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1162";
      LogicTestLog.begin(name, "unsafe name \"a\\u0000b\"; type=FileType.AUDIO");
      files.names = ["protected-6.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-6.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("a\u0000b");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-6.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-6.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-6.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-6.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-6.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-6.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-6.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-6.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-6.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-6.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-6.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-6.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-6.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-6.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-6.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-6.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-6.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1163
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1163
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1163", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1163";
      LogicTestLog.begin(name, "unsafe name \"a\\nb\"; type=FileType.FILE");
      files.names = ["protected-7.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-7.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("a\nb");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-7.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-7.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-7.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-7.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-7.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-7.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-7.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-7.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-7.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-7.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-7.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-7.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-7.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-7.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-7.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-7.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-7.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1164
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1164
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1164", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1164";
      LogicTestLog.begin(name, "unsafe name \"a\\rb\"; type=FileType.AUDIO");
      files.names = ["protected-8.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-8.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("a\rb");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-8.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-8.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-8.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-8.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-8.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-8.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-8.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-8.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-8.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-8.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-8.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-8.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-8.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-8.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-8.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-8.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-8.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1165
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1165
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1165", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1165";
      LogicTestLog.begin(name, "unsafe name \"a\\tb\"; type=FileType.FILE");
      files.names = ["protected-9.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-9.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("a\tb");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-9.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-9.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-9.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-9.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-9.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-9.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-9.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-9.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-9.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original", "/synthetic/media/alpha/protected-9.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-9.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-9.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-9.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-9.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-9.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-9.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-9.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1166
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1166
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1166", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1166";
      LogicTestLog.begin(name, "unsafe name \"ab\"; type=FileType.AUDIO");
      files.names = ["protected-10.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-10.mp3", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("ab");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-10.mp3",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-10.mp3");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-10.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("protected-10.mp3");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-10.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-10.mp3|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-10.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-10.mp3"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-10.mp3");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original",
        "/synthetic/media/alpha/protected-10.mp3", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-10.mp3");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-10.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-10.mp3");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-10.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-10.mp3");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-10.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("safe-10.mp3");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1167
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1167
     * @tc.nameDesc Unsafe sandbox names reject before filesystem work: Check empty, dot, traversal, separator and
     * control names preserve state and allow a later safe rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1167", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1167";
      LogicTestLog.begin(name, "unsafe name \"ab\"; type=FileType.FILE");
      files.names = ["protected-11.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/protected-11.txt", 777);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("ab");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Unsafe rename rejection", "Invalid sandbox display name", message);
      expect(message).assertEqual("Invalid sandbox display name");
      LogicTestLog.number(name, "No filesystem rename request", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after unsafe name", "/synthetic/media/alpha/protected-11.txt",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/protected-11.txt");
      LogicTestLog.value(name, "Display name unchanged after unsafe name", "protected-11.txt", handle.displayName);
      expect(handle.displayName).assertEqual("protected-11.txt");
      LogicTestLog.number(name, "Type unchanged after unsafe name", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Directory unchanged after unsafe name", "protected-11.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("protected-11.txt|untouched.bin");
      LogicTestLog.number(name, "Original mtime survives", 777,
        Number(files.mtimes.get("/synthetic/media/alpha/protected-11.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/protected-11.txt"))).assertEqual(777);
      LogicTestLog.number(name, "No descriptor open from unsafe rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No unlink from unsafe rename", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Validation precedes any filesystem call", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
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
      await handle.rename("safe-11.txt");
      LogicTestLog.number(name, "Safe retry issues one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Safe retry source remains original",
        "/synthetic/media/alpha/protected-11.txt", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/protected-11.txt");
      LogicTestLog.value(name, "Safe retry target is sandbox contained", "/synthetic/media/alpha/safe-11.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/safe-11.txt");
      LogicTestLog.value(name, "Safe retry updates URI", "/synthetic/media/alpha/safe-11.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/safe-11.txt");
      LogicTestLog.value(name, "Safe retry does not double extension", "safe-11.txt", handle.displayName);
      expect(handle.displayName).assertEqual("safe-11.txt");
      LogicTestLog.value(name, "Only safe retry enters filesystem", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1168
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1168
     * @tc.nameDesc Sandbox rename publishes metadata only after fs success: Check unchanged exposed metadata and source
     * mtime on failed rename, then exact-source retry success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1168", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1168";
      LogicTestLog.begin(name, "FileType.AUDIO; rename renamed-0; injected filesystem rejection");
      files.names = ["original-0.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/original-0.mp3", 888);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      files.renameError = "synthetic rename rejected 0";
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("renamed-0");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Native rename rejection propagated", "synthetic rename rejected 0", message);
      expect(message).assertEqual("synthetic rename rejected 0");
      LogicTestLog.number(name, "Failed rename attempted once", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Failed rename source", "/synthetic/media/alpha/original-0.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/original-0.mp3");
      LogicTestLog.value(name, "Failed rename target", "/synthetic/media/alpha/renamed-0.mp3", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/renamed-0.mp3");
      LogicTestLog.value(name, "Failed rename does not publish URI", "/synthetic/media/alpha/original-0.mp3",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/original-0.mp3");
      LogicTestLog.value(name, "Failed rename does not publish name", "original-0.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("original-0.mp3");
      LogicTestLog.value(name, "Failed rename does not alter input names", "original-0.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("original-0.mp3|untouched.bin");
      LogicTestLog.number(name, "Source mtime survives failure", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/original-0.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/original-0.mp3"))).assertEqual(888);
      LogicTestLog.flag(name, "Target mtime absent after failure",
        files.mtimes.has("/synthetic/media/alpha/renamed-0.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/renamed-0.mp3")).assertFalse();
      LogicTestLog.value(name, "Failed rename operation order", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      files.renameError = '';
      await handle.rename("renamed-0");
      LogicTestLog.number(name, "Retry attempts filesystem rename", 2, files.renames.length);
      expect(files.renames.length).assertEqual(2);
      LogicTestLog.value(name, "Retry source is still original URI", "/synthetic/media/alpha/original-0.mp3",
        files.renames[1].source);
      expect(files.renames[1].source).assertEqual("/synthetic/media/alpha/original-0.mp3");
      LogicTestLog.value(name, "Retry target extension is not duplicated",
        "/synthetic/media/alpha/renamed-0.mp3", files.renames[1].target);
      expect(files.renames[1].target).assertEqual("/synthetic/media/alpha/renamed-0.mp3");
      LogicTestLog.value(name, "Retry publishes target URI", "/synthetic/media/alpha/renamed-0.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/renamed-0.mp3");
      LogicTestLog.value(name, "Retry publishes target name", "renamed-0.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("renamed-0.mp3");
      LogicTestLog.number(name, "Mtime moves only after success", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/renamed-0.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/renamed-0.mp3"))).assertEqual(888);
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
      LogicTestLog.value(name, "Failure and retry order", "files.rename|files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1169
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1169
     * @tc.nameDesc Sandbox rename publishes metadata only after fs success: Check unchanged exposed metadata and source
     * mtime on failed rename, then exact-source retry success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1169", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1169";
      LogicTestLog.begin(name, "FileType.FILE; rename renamed-1; injected filesystem rejection");
      files.names = ["original-1.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/original-1.txt", 888);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      files.renameError = "synthetic rename rejected 1";
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("renamed-1");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Native rename rejection propagated", "synthetic rename rejected 1", message);
      expect(message).assertEqual("synthetic rename rejected 1");
      LogicTestLog.number(name, "Failed rename attempted once", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Failed rename source", "/synthetic/media/alpha/original-1.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/original-1.txt");
      LogicTestLog.value(name, "Failed rename target", "/synthetic/media/alpha/renamed-1.txt", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/renamed-1.txt");
      LogicTestLog.value(name, "Failed rename does not publish URI", "/synthetic/media/alpha/original-1.txt",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/original-1.txt");
      LogicTestLog.value(name, "Failed rename does not publish name", "original-1.txt", handle.displayName);
      expect(handle.displayName).assertEqual("original-1.txt");
      LogicTestLog.value(name, "Failed rename does not alter input names", "original-1.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("original-1.txt|untouched.bin");
      LogicTestLog.number(name, "Source mtime survives failure", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/original-1.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/original-1.txt"))).assertEqual(888);
      LogicTestLog.flag(name, "Target mtime absent after failure",
        files.mtimes.has("/synthetic/media/alpha/renamed-1.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/renamed-1.txt")).assertFalse();
      LogicTestLog.value(name, "Failed rename operation order", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      files.renameError = '';
      await handle.rename("renamed-1");
      LogicTestLog.number(name, "Retry attempts filesystem rename", 2, files.renames.length);
      expect(files.renames.length).assertEqual(2);
      LogicTestLog.value(name, "Retry source is still original URI", "/synthetic/media/alpha/original-1.txt",
        files.renames[1].source);
      expect(files.renames[1].source).assertEqual("/synthetic/media/alpha/original-1.txt");
      LogicTestLog.value(name, "Retry target extension is not duplicated",
        "/synthetic/media/alpha/renamed-1.txt", files.renames[1].target);
      expect(files.renames[1].target).assertEqual("/synthetic/media/alpha/renamed-1.txt");
      LogicTestLog.value(name, "Retry publishes target URI", "/synthetic/media/alpha/renamed-1.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/renamed-1.txt");
      LogicTestLog.value(name, "Retry publishes target name", "renamed-1.txt", handle.displayName);
      expect(handle.displayName).assertEqual("renamed-1.txt");
      LogicTestLog.number(name, "Mtime moves only after success", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/renamed-1.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/renamed-1.txt"))).assertEqual(888);
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
      LogicTestLog.value(name, "Failure and retry order", "files.rename|files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1170
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1170
     * @tc.nameDesc Sandbox rename publishes metadata only after fs success: Check unchanged exposed metadata and source
     * mtime on failed rename, then exact-source retry success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1170", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1170";
      LogicTestLog.begin(name, "FileType.AUDIO; rename renamed-2.mp3; injected filesystem rejection");
      files.names = ["original-2.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/original-2.mp3", 888);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = handles[0];
      files.renameError = "synthetic rename rejected 2";
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("renamed-2.mp3");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Native rename rejection propagated", "synthetic rename rejected 2", message);
      expect(message).assertEqual("synthetic rename rejected 2");
      LogicTestLog.number(name, "Failed rename attempted once", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Failed rename source", "/synthetic/media/alpha/original-2.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/original-2.mp3");
      LogicTestLog.value(name, "Failed rename target", "/synthetic/media/alpha/renamed-2.mp3", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/renamed-2.mp3");
      LogicTestLog.value(name, "Failed rename does not publish URI", "/synthetic/media/alpha/original-2.mp3",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/original-2.mp3");
      LogicTestLog.value(name, "Failed rename does not publish name", "original-2.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("original-2.mp3");
      LogicTestLog.value(name, "Failed rename does not alter input names", "original-2.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("original-2.mp3|untouched.bin");
      LogicTestLog.number(name, "Source mtime survives failure", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/original-2.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/original-2.mp3"))).assertEqual(888);
      LogicTestLog.flag(name, "Target mtime absent after failure",
        files.mtimes.has("/synthetic/media/alpha/renamed-2.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/renamed-2.mp3")).assertFalse();
      LogicTestLog.value(name, "Failed rename operation order", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      files.renameError = '';
      await handle.rename("renamed-2.mp3");
      LogicTestLog.number(name, "Retry attempts filesystem rename", 2, files.renames.length);
      expect(files.renames.length).assertEqual(2);
      LogicTestLog.value(name, "Retry source is still original URI", "/synthetic/media/alpha/original-2.mp3",
        files.renames[1].source);
      expect(files.renames[1].source).assertEqual("/synthetic/media/alpha/original-2.mp3");
      LogicTestLog.value(name, "Retry target extension is not duplicated",
        "/synthetic/media/alpha/renamed-2.mp3", files.renames[1].target);
      expect(files.renames[1].target).assertEqual("/synthetic/media/alpha/renamed-2.mp3");
      LogicTestLog.value(name, "Retry publishes target URI", "/synthetic/media/alpha/renamed-2.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/renamed-2.mp3");
      LogicTestLog.value(name, "Retry publishes target name", "renamed-2.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("renamed-2.mp3");
      LogicTestLog.number(name, "Mtime moves only after success", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/renamed-2.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/renamed-2.mp3"))).assertEqual(888);
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
      LogicTestLog.value(name, "Failure and retry order", "files.rename|files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1171
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1171
     * @tc.nameDesc Sandbox rename publishes metadata only after fs success: Check unchanged exposed metadata and source
     * mtime on failed rename, then exact-source retry success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1171", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1171";
      LogicTestLog.begin(name, "FileType.FILE; rename renamed-3.txt; injected filesystem rejection");
      files.names = ["original-3.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/original-3.txt", 888);
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = handles[0];
      files.renameError = "synthetic rename rejected 3";
      trace.clear();
      let message: string = '';
      try {
        await handle.rename("renamed-3.txt");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Native rename rejection propagated", "synthetic rename rejected 3", message);
      expect(message).assertEqual("synthetic rename rejected 3");
      LogicTestLog.number(name, "Failed rename attempted once", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Failed rename source", "/synthetic/media/alpha/original-3.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/original-3.txt");
      LogicTestLog.value(name, "Failed rename target", "/synthetic/media/alpha/renamed-3.txt", files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/renamed-3.txt");
      LogicTestLog.value(name, "Failed rename does not publish URI", "/synthetic/media/alpha/original-3.txt",
        handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/original-3.txt");
      LogicTestLog.value(name, "Failed rename does not publish name", "original-3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("original-3.txt");
      LogicTestLog.value(name, "Failed rename does not alter input names", "original-3.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("original-3.txt|untouched.bin");
      LogicTestLog.number(name, "Source mtime survives failure", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/original-3.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/original-3.txt"))).assertEqual(888);
      LogicTestLog.flag(name, "Target mtime absent after failure",
        files.mtimes.has("/synthetic/media/alpha/renamed-3.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/renamed-3.txt")).assertFalse();
      LogicTestLog.value(name, "Failed rename operation order", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      files.renameError = '';
      await handle.rename("renamed-3.txt");
      LogicTestLog.number(name, "Retry attempts filesystem rename", 2, files.renames.length);
      expect(files.renames.length).assertEqual(2);
      LogicTestLog.value(name, "Retry source is still original URI", "/synthetic/media/alpha/original-3.txt",
        files.renames[1].source);
      expect(files.renames[1].source).assertEqual("/synthetic/media/alpha/original-3.txt");
      LogicTestLog.value(name, "Retry target extension is not duplicated",
        "/synthetic/media/alpha/renamed-3.txt", files.renames[1].target);
      expect(files.renames[1].target).assertEqual("/synthetic/media/alpha/renamed-3.txt");
      LogicTestLog.value(name, "Retry publishes target URI", "/synthetic/media/alpha/renamed-3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/renamed-3.txt");
      LogicTestLog.value(name, "Retry publishes target name", "renamed-3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("renamed-3.txt");
      LogicTestLog.number(name, "Mtime moves only after success", 888,
        Number(files.mtimes.get("/synthetic/media/alpha/renamed-3.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/renamed-3.txt"))).assertEqual(888);
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
      LogicTestLog.value(name, "Failure and retry order", "files.rename|files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.rename");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1172
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1172
     * @tc.nameDesc Photo rename refreshes exposed metadata only after commit: Verify set-commit-get ordering, canonical
     * native display names, error propagation and retry without fs rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1172", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1172";
      LogicTestLog.begin(name, "FileType.IMAGE; rename stage success");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-rename-0", photoAccessHelper.PhotoType.IMAGE, "old-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-rename-0";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      photo.committedDisplayName = "canonical-0.jpg";
      let message: string = '';
      try {
        await handle.rename("requested-0.jpg");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Photo rename outcome", "", message);
      expect(message).assertEqual("");
      LogicTestLog.number(name, "Display name set attempted once", 1, photo.sets.length);
      expect(photo.sets.length).assertEqual(1);
      LogicTestLog.value(name, "Display name native key", "display_name", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("display_name");
      LogicTestLog.value(name, "Requested display name forwarded", "requested-0.jpg", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("requested-0.jpg");
      LogicTestLog.number(name, "Commit skipped after set rejection", 1, photo.commits);
      expect(photo.commits).assertEqual(1);
      LogicTestLog.number(name, "Metadata refresh only follows committed rename", 2, photo.gets.length);
      expect(photo.gets.length).assertEqual(2);
      LogicTestLog.value(name, "Published display name follows success only", "canonical-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("canonical-0.jpg");
      LogicTestLog.value(name, "Photo rename never changes URI", "fake://media/photo-rename-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-0");
      LogicTestLog.number(name, "Photo rename keeps media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.value(name, "Photo rename native call order", "photo.set|photo.commit|photo.get",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set|photo.commit|photo.get");
      LogicTestLog.number(name, "No filesystem rename for photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open for photo rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No extra photo fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Creation result already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      photo.setError = '';
      photo.commitError = '';
      photo.getError = '';
      photo.committedDisplayName = '';
      await handle.rename("retry-0.jpg");
      LogicTestLog.value(name, "Successful retry publishes refreshed name", "retry-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("retry-0.jpg");
      LogicTestLog.number(name, "Retry set request count", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Retry forwards distinct requested name", "retry-0.jpg", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("retry-0.jpg");
      LogicTestLog.number(name, "Retry commit count", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.value(name, "Retry reads native name after commit",
        "photo.set|photo.commit|photo.get|photo.set|photo.commit|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set|photo.commit|photo.get|photo.set|photo.commit|photo.get");
      LogicTestLog.value(name, "Retry URI remains native URI", "fake://media/photo-rename-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-0");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1173
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1173
     * @tc.nameDesc Photo rename refreshes exposed metadata only after commit: Verify set-commit-get ordering, canonical
     * native display names, error propagation and retry without fs rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1173", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1173";
      LogicTestLog.begin(name, "FileType.VIDEO; rename stage success");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-rename-1", photoAccessHelper.PhotoType.VIDEO, "old-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-rename-1";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      photo.committedDisplayName = "canonical-1.mp4";
      let message: string = '';
      try {
        await handle.rename("requested-1.mp4");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Photo rename outcome", "", message);
      expect(message).assertEqual("");
      LogicTestLog.number(name, "Display name set attempted once", 1, photo.sets.length);
      expect(photo.sets.length).assertEqual(1);
      LogicTestLog.value(name, "Display name native key", "display_name", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("display_name");
      LogicTestLog.value(name, "Requested display name forwarded", "requested-1.mp4", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("requested-1.mp4");
      LogicTestLog.number(name, "Commit skipped after set rejection", 1, photo.commits);
      expect(photo.commits).assertEqual(1);
      LogicTestLog.number(name, "Metadata refresh only follows committed rename", 2, photo.gets.length);
      expect(photo.gets.length).assertEqual(2);
      LogicTestLog.value(name, "Published display name follows success only", "canonical-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("canonical-1.mp4");
      LogicTestLog.value(name, "Photo rename never changes URI", "fake://media/photo-rename-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-1");
      LogicTestLog.number(name, "Photo rename keeps media type", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.value(name, "Photo rename native call order", "photo.set|photo.commit|photo.get",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set|photo.commit|photo.get");
      LogicTestLog.number(name, "No filesystem rename for photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open for photo rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No extra photo fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Creation result already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      photo.setError = '';
      photo.commitError = '';
      photo.getError = '';
      photo.committedDisplayName = '';
      await handle.rename("retry-1.mp4");
      LogicTestLog.value(name, "Successful retry publishes refreshed name", "retry-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("retry-1.mp4");
      LogicTestLog.number(name, "Retry set request count", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Retry forwards distinct requested name", "retry-1.mp4", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("retry-1.mp4");
      LogicTestLog.number(name, "Retry commit count", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.value(name, "Retry reads native name after commit",
        "photo.set|photo.commit|photo.get|photo.set|photo.commit|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set|photo.commit|photo.get|photo.set|photo.commit|photo.get");
      LogicTestLog.value(name, "Retry URI remains native URI", "fake://media/photo-rename-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-1");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1174
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1174
     * @tc.nameDesc Photo rename refreshes exposed metadata only after commit: Verify set-commit-get ordering, canonical
     * native display names, error propagation and retry without fs rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1174", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1174";
      LogicTestLog.begin(name, "FileType.IMAGE; rename stage set");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-rename-2", photoAccessHelper.PhotoType.IMAGE, "old-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-rename-2";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      photo.setError = "synthetic photo set failure 2";
      let message: string = '';
      try {
        await handle.rename("requested-2.jpg");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Photo rename outcome", "synthetic photo set failure 2", message);
      expect(message).assertEqual("synthetic photo set failure 2");
      LogicTestLog.number(name, "Display name set attempted once", 1, photo.sets.length);
      expect(photo.sets.length).assertEqual(1);
      LogicTestLog.value(name, "Display name native key", "display_name", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("display_name");
      LogicTestLog.value(name, "Requested display name forwarded", "requested-2.jpg", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("requested-2.jpg");
      LogicTestLog.number(name, "Commit skipped after set rejection", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Metadata refresh only follows committed rename", 1, photo.gets.length);
      expect(photo.gets.length).assertEqual(1);
      LogicTestLog.value(name, "Published display name follows success only", "old-2.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("old-2.jpg");
      LogicTestLog.value(name, "Photo rename never changes URI", "fake://media/photo-rename-2", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-2");
      LogicTestLog.number(name, "Photo rename keeps media type", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.value(name, "Photo rename native call order", "photo.set", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set");
      LogicTestLog.number(name, "No filesystem rename for photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open for photo rename", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No extra photo fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Creation result already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      photo.setError = '';
      photo.commitError = '';
      photo.getError = '';
      photo.committedDisplayName = '';
      await handle.rename("retry-2.jpg");
      LogicTestLog.value(name, "Successful retry publishes refreshed name", "retry-2.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("retry-2.jpg");
      LogicTestLog.number(name, "Retry set request count", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Retry forwards distinct requested name", "retry-2.jpg", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("retry-2.jpg");
      LogicTestLog.number(name, "Retry commit count", 1, photo.commits);
      expect(photo.commits).assertEqual(1);
      LogicTestLog.value(name, "Retry reads native name after commit",
        "photo.set|photo.set|photo.commit|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("photo.set|photo.set|photo.commit|photo.get");
      LogicTestLog.value(name, "Retry URI remains native URI", "fake://media/photo-rename-2", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-rename-2");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1175
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1175
     * @tc.nameDesc Photo rename refreshes exposed metadata only after commit: Verify set-commit-get ordering, canonical
     * native display names, error propagation and retry without fs rename.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1175", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1175";
      LogicTestLog.begin(name, "FileType.VIDEO; rename stage set");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-rename-3", photoAccessHelper.PhotoType.VIDEO, "old-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-rename-3";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      photo.setError = "synthetic photo set failure 3";
      let message: string = '';
      try {
        await handle.rename("requested-3.mp4");
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Photo rename outcome", "synthetic photo set failure 3", message);
      expect(message).assertEqual("synthetic photo set failure 3");
      LogicTestLog.number(name, "Display name set attempted once", 1, photo.sets.length);
      expect(photo.sets.length).assertEqual(1);
      LogicTestLog.value(name, "Display name native key", "display_name", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("display_name");