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

import { describe, it, expect } from '@ohos/hypium';
import MyDataSource, { SongItem } from '../../../main/ets/model/SongModule';
import { optionList, songList } from '../../../main/ets/model/SongList';
import {
  ALBUM_FONT_LG,
  ALBUM_FONT_MD,
  ALBUM_FONT_SM,
  ALBUM_MARGIN_LG,
  ALBUM_MARGIN_MD,
  ALBUM_MARGIN_SM,
  ALBUM_MISSING_ID,
  ALBUM_OPTION_COUNT,
  ALBUM_TRACK_COUNT,
  AlbumModel,
  AlbumOption,
  AlbumTrack
} from './Shared/AlbumModel';

const DATASET = 'AlbumExtensionTest_';

class AlbumListener implements DataChangeListener {
  name: string = '';
  log: string[] = [];
  reloadCount: number = 0;
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  lastAddIndex: number = -1;
  lastMoveFrom: number = -1;
  lastMoveTo: number = -1;

  constructor(name: string, log: string[]) {
    this.name = name;
    this.log = log;
  }

  onDataReloaded(reuseImmediately?: boolean): void {
    this.reloadCount++;
    this.log.push(this.name + ':reload');
  }

  onDataAdded(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
    this.log.push(this.name + ':add');
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
    this.log.push(this.name + ':add');
  }

  onDataMoved(from: number, to: number): void {
    this.moveCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
    this.log.push(this.name + ':move');
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
    this.log.push(this.name + ':move');
  }

  onDataDeleted(index: number): void {
    this.deleteCount++;
    this.log.push(this.name + ':delete');
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.log.push(this.name + ':delete');
  }

  onDataChanged(index: number): void {
    this.changeCount++;
    this.log.push(this.name + ':change');
  }

  onDataChange(index: number): void {
    this.changeCount++;
    this.log.push(this.name + ':change');
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.changeCount++;
    this.log.push(this.name + ':dataset');
  }
}

function makeTrack(id: number, title: string): SongItem {
  const track: SongItem = { id: id, title: title, singer: 'singer', label: $r('app.media.ic_SQ') };
  return track;
}

export default function albumExtensionSuite() {
  describe('AlbumFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1280
     * @tc.name    AlbumExtension1280
     * @tc.desc    Font size grows with the breakpoint from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'fontOf_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('sm')).assertEqual(ALBUM_FONT_SM);
      expect(model.fontOf('md')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('lg')).assertEqual(ALBUM_FONT_LG);
      expect(model.fontOf('sm') < model.fontOf('lg')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1281
     * @tc.name    AlbumExtension1281
     * @tc.desc    Unknown breakpoints fall back to the medium font size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontOf_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('xs')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('SM')).assertEqual(ALBUM_FONT_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1282
     * @tc.name    AlbumExtension1282
     * @tc.desc    Cover margin grows with the breakpoint from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'marginOf_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('sm')).assertEqual(ALBUM_MARGIN_SM);
      expect(model.marginOf('md')).assertEqual(ALBUM_MARGIN_MD);
      expect(model.marginOf('lg')).assertEqual(ALBUM_MARGIN_LG);
      expect(model.marginOf('sm') < model.marginOf('lg')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1283
     * @tc.name    AlbumExtension1283
     * @tc.desc    Unknown breakpoints fall back to the medium cover margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginOf_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('tablet')).assertEqual(ALBUM_MARGIN_MD);
      expect(model.marginOf('')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1284
     * @tc.name    AlbumExtension1284
     * @tc.desc    Font size table is monotonic from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isFontMonotonic_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.isFontMonotonic()).assertTrue();
      expect(ALBUM_FONT_SM <= ALBUM_FONT_MD).assertTrue();
      expect(ALBUM_FONT_MD <= ALBUM_FONT_LG).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1285
     * @tc.name    AlbumExtension1285
     * @tc.desc    Cover margin table is monotonic from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isMarginMonotonic_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.isMarginMonotonic()).assertTrue();
      expect(ALBUM_MARGIN_SM <= ALBUM_MARGIN_MD).assertTrue();
      expect(ALBUM_MARGIN_MD <= ALBUM_MARGIN_LG).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1286
     * @tc.name    AlbumExtension1286
     * @tc.desc    Track count matches the shared album constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getTrackCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT);
      expect(model.getTracks().length).assertEqual(ALBUM_TRACK_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1287
     * @tc.name    AlbumExtension1287
     * @tc.desc    Track accessor reuses the same backing array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTracks_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks() === model.getTracks()).assertTrue();
      expect(model.getTracks()[0] === model.getTrackById(model.getTracks()[0].id)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1288
     * @tc.name    AlbumExtension1288
     * @tc.desc    Album keeps the known gap where track twenty two is missing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasMissingId_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasMissingId()).assertTrue();
      expect(model.getTrackById(ALBUM_MISSING_ID) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1289
     * @tc.name    AlbumExtension1289
     * @tc.desc    All generated track identifiers are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hasUniqueIds_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasUniqueIds()).assertTrue();
      const ids: number[] = [];
      model.getTracks().forEach((track: AlbumTrack) => {
        ids.push(track.id);
      });
      expect(ids.indexOf(ALBUM_MISSING_ID)).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1290
     * @tc.name    AlbumExtension1290
     * @tc.desc    Identifiers following the gap are shifted by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const afterGap: AlbumTrack | undefined = model.getTrackById(ALBUM_MISSING_ID + 1);
      expect(afterGap !== undefined).assertTrue();
      expect((afterGap as AlbumTrack).id).assertEqual(ALBUM_MISSING_ID + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1291
     * @tc.name    AlbumExtension1291
     * @tc.desc    Last track identifier stays inside the shifted sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(ALBUM_TRACK_COUNT + 1) !== undefined).assertTrue();
      expect(model.getTrackById(ALBUM_TRACK_COUNT + 2) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1292
     * @tc.name    AlbumExtension1292
     * @tc.desc    Track lookup rejects zero and negative identifiers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_003', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(0) === undefined).assertTrue();
      expect(model.getTrackById(-1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1293
     * @tc.name    AlbumExtension1293
     * @tc.desc    VIP track count matches the every sixth track labelling rule
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'countVip_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.countVip()).assertEqual(4);
      let manual: number = 0;
      model.getTracks().forEach((track: AlbumTrack) => {
        if (track.label === 'ic_vip') {
          manual++;
        }
      });
      expect(model.countVip()).assertEqual(manual);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1294
     * @tc.name    AlbumExtension1294
     * @tc.desc    Non VIP tracks carry the standard quality label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'labelCheck_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackCount() - model.countVip()).assertEqual(20);
      model.getTracks().forEach((track: AlbumTrack) => {
        expect(track.label === 'ic_vip' || track.label === 'ic_SQ').assertTrue();
      });
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1295
     * @tc.name    AlbumExtension1295
     * @tc.desc    Singer count reflects the five distinct generated singers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'singerCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.singerCount()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1296
     * @tc.name    AlbumExtension1296
     * @tc.desc    Option count matches the shared option constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getOptionCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptionCount()).assertEqual(ALBUM_OPTION_COUNT);
      expect(model.getOptions().length).assertEqual(ALBUM_OPTION_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1297
     * @tc.name    AlbumExtension1297
     * @tc.desc    Options are exposed in collect, download, comment, share order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getOptions_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const options: AlbumOption[] = model.getOptions();
      expect(options[0].key).assertEqual('collect');
      expect(options[1].key).assertEqual('download');
      expect(options[2].key).assertEqual('comment');
      expect(options[3].key).assertEqual('share');
      expect(options[0].text).assertEqual('999+');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1298
     * @tc.name    AlbumExtension1298
     * @tc.desc    Track titles use the one based generated pattern
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'trackTitles_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const tracks: AlbumTrack[] = model.getTracks();
      expect(tracks[0].title).assertEqual('track1');
      expect(tracks[tracks.length - 1].title).assertEqual('track' + String(ALBUM_TRACK_COUNT));
      expect(tracks[0].title === tracks[1].title).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1299
     * @tc.name    AlbumExtension1299
     * @tc.desc    First page exposes a full page in album order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const first: AlbumTrack[] = model.slicePage(0, 10);
      expect(first.length).assertEqual(10);
      expect(first[0].id).assertEqual(1);
      expect(first[9].id).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1300
     * @tc.name    AlbumExtension1300
     * @tc.desc    Last page exposes only the remaining tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(2, 10).length).assertEqual(4);
      expect(model.slicePage(1, 10)[0].title).assertEqual('track11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1301
     * @tc.name    AlbumExtension1301
     * @tc.desc    A page beyond the last index yields an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_003', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(3, 10).length).assertEqual(0);
      expect(model.slicePage(ALBUM_TRACK_COUNT, 10).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1302
     * @tc.name    AlbumExtension1302
     * @tc.desc    Page count guards non positive page sizes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(0)).assertEqual(0);
      expect(model.totalPages(-3)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1303
     * @tc.name    AlbumExtension1303
     * @tc.desc    Page count rounds partial pages and honours oversized page sizes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(1)).assertEqual(ALBUM_TRACK_COUNT);
      expect(model.totalPages(7)).assertEqual(4);
      expect(model.totalPages(ALBUM_TRACK_COUNT)).assertEqual(1);
      expect(model.totalPages(ALBUM_TRACK_COUNT + 1)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1304
     * @tc.name    AlbumExtension1304
     * @tc.desc    Constructor copies the caller array so later pushes stay local
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'constructor_001', 0, () => {
      const local: SongItem[] = [makeTrack(1, 'first')];
      const source: MyDataSource = new MyDataSource(local);
      local.push(makeTrack(2, 'second'));
      expect(source.totalCount()).assertEqual(1);
      expect(local.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1305
     * @tc.name    AlbumExtension1305
     * @tc.desc    Constructor keeps item references so later field changes are visible
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'constructor_002', 0, () => {
      const local: SongItem[] = [makeTrack(1, 'before')];
      const source: MyDataSource = new MyDataSource(local);
      local[0].title = 'after';
      expect(source.getData(0).title).assertEqual('after');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1306
     * @tc.name    AlbumExtension1306
     * @tc.desc    Inserting directly after the last index appends the track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(2, makeTrack(3, 'c'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1307
     * @tc.name    AlbumExtension1307
     * @tc.desc    Inserting in the middle shifts only the following tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_002', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      source.addData(1, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0).title).assertEqual('a');
      expect(source.getData(1).title).assertEqual('x');
      expect(source.getData(2).title).assertEqual('b');
      expect(source.getData(3).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1308
     * @tc.name    AlbumExtension1308
     * @tc.desc    Negative insertion index places the track before the final element
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_003', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      source.addData(-1, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(2).title).assertEqual('x');
      expect(source.getData(3).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1309
     * @tc.name    AlbumExtension1309
     * @tc.desc    Appended track keeps object identity with the caller payload
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushData_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const track: SongItem = makeTrack(7, 'seven');
      source.pushData(track);
      expect(source.getData(0) === track).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1310
     * @tc.name    AlbumExtension1310
     * @tc.desc    Every registered listener receives an append notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(makeTrack(1, 'a'));
      expect(first.addCount).assertEqual(1);
      expect(second.addCount).assertEqual(1);
      expect(second.lastAddIndex).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1311
     * @tc.name    AlbumExtension1311
     * @tc.desc    Listeners are notified in registration order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_002', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(makeTrack(1, 'a'));
      expect(log.length).assertEqual(2);
      expect(log[0]).assertEqual('first:add');
      expect(log[1]).assertEqual('second:add');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1312
     * @tc.name    AlbumExtension1312
     * @tc.desc    Removing one listener leaves the remaining listener active
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_003', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.pushData(makeTrack(1, 'a'));
      expect(first.addCount).assertEqual(0);
      expect(second.addCount).assertEqual(1);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('second:add');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1313
     * @tc.name    AlbumExtension1313
     * @tc.desc    Listener registered after existing data is not replayed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_004', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const log: string[] = [];
      const listener: AlbumListener = new AlbumListener('late', log);
      source.registerDataChangeListener(listener);
      expect(listener.addCount).assertEqual(0);
      expect(log.length).assertEqual(0);
      source.pushData(makeTrack(2, 'b'));
      expect(listener.addCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1314
     * @tc.name    AlbumExtension1314
     * @tc.desc    Reload notification reaches every registered listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notify_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.reloadCount).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      expect(log.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1315
     * @tc.name    AlbumExtension1315
     * @tc.desc    Option text may be either a literal string or a resource reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionList_001', 0, () => {
      expect(typeof optionList[0].text).assertEqual('string');
      expect((optionList[0].text as string)).assertEqual('999+');
      expect(typeof optionList[1].text === 'string').assertFalse();
      expect((optionList[1].text as Resource).id > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1316
     * @tc.name    AlbumExtension1316
     * @tc.desc    Source song list exposes twenty four tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListCount_001', 0, () => {
      expect(songList.length).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1317
     * @tc.name    AlbumExtension1317
     * @tc.desc    Source list starts at one and ends at twenty five
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListFirstLast_001', 0, () => {
      const firstTrack: SongItem = songList[0];
      const lastTrack: SongItem = songList[23];
      expect(firstTrack.id).assertEqual(1);
      expect(lastTrack.id).assertEqual(25);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1318
     * @tc.name    AlbumExtension1318
     * @tc.desc    Source list skips identifier twenty two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListGap_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < songList.length; i++) {
        ids.add(songList[i].id);
      }
      expect(ids.size).assertEqual(24);
      expect(ids.has(22)).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1319
     * @tc.name    AlbumExtension1319
     * @tc.desc    Source identifiers increase by one around the gap
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListOrder_001', 0, () => {
      for (let i = 1; i < songList.length; i++) {
        const previous: number = songList[i - 1].id;
        const expected: number = previous === 21 ? 23 : previous + 1;
        expect(songList[i].id).assertEqual(expected);
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1320
     * @tc.name    AlbumExtension1320
     * @tc.desc    Source list marks exactly two tracks as VIP
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListVip_001', 0, () => {
      const vipId: number = songList[0].label.id;
      let count: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (songList[i].label.id === vipId) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1321
     * @tc.name    AlbumExtension1321
     * @tc.desc    Remaining source tracks carry the standard label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListQuality_001', 0, () => {
      const vipId: number = songList[0].label.id;
      const sqId: number = songList[1].label.id;
      expect(sqId === vipId).assertFalse();
      let count: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (songList[i].label.id === sqId) {
          count++;
        }
      }
      expect(count).assertEqual(22);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1322
     * @tc.name    AlbumExtension1322
     * @tc.desc    Repeated source captions keep the same singer
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListRepeat_001', 0, () => {
      const head: SongItem = songList[0];
      const twin: SongItem = songList[11];
      expect(head.title).assertEqual(twin.title);
      expect(head.singer).assertEqual(twin.singer);
      const late: SongItem = songList[10];
      expect(late.title).assertEqual(songList[21].title);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1323
     * @tc.name    AlbumExtension1323
     * @tc.desc    Distinct source titles are fewer than the track count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListDuplicateTitles_001', 0, () => {
      const titles: Set<string> = new Set<string>();
      for (let i = 0; i < songList.length; i++) {
        titles.add(songList[i].title);
      }
      expect(titles.size < songList.length).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1324
     * @tc.name    AlbumExtension1324
     * @tc.desc    Every source track carries non empty text fields
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListFields_001', 0, () => {
      for (let i = 0; i < songList.length; i++) {
        expect(typeof songList[i].title).assertEqual('string');
        expect(songList[i].title.length > 0).assertTrue();
        expect(songList[i].singer.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1325
     * @tc.name    AlbumExtension1325
     * @tc.desc    Source label resources resolve to positive identifiers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListLabels_001', 0, () => {
      for (let i = 0; i < songList.length; i++) {
        expect(songList[i].label.id > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1326
     * @tc.name    AlbumExtension1326
     * @tc.desc    Source list uses exactly two label resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListLabelSet_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < songList.length; i++) {
        ids.add(songList[i].label.id);
      }
      expect(ids.size).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1327
     * @tc.name    AlbumExtension1327
     * @tc.desc    Every action option owns a distinct icon resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionImages_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < optionList.length; i++) {
        expect(optionList[i].image.id > 0).assertTrue();
        ids.add(optionList[i].image.id);
      }
      expect(ids.size).assertEqual(optionList.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1328
     * @tc.name    AlbumExtension1328
     * @tc.desc    Only the collect option uses a literal caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionTextKinds_001', 0, () => {
      expect(typeof optionList[0].text).assertEqual('string');
      expect(typeof optionList[1].text === 'string').assertFalse();
      expect(typeof optionList[2].text === 'string').assertFalse();
      expect(typeof optionList[3].text === 'string').assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1329
     * @tc.name    AlbumExtension1329
     * @tc.desc    Remaining action captions resolve to resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionResources_001', 0, () => {
      for (let i = 1; i < optionList.length; i++) {
        expect((optionList[i].text as Resource).id > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1330
     * @tc.name    AlbumExtension1330
     * @tc.desc    Change notification reaches every listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyChange_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const first: AlbumListener = new AlbumListener('first', []);
      const second: AlbumListener = new AlbumListener('second', []);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(1);
      expect(first.changeCount).assertEqual(1);
      expect(second.changeCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1331
     * @tc.name    AlbumExtension1331
     * @tc.desc    Delete notification reaches every listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyDelete_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const first: AlbumListener = new AlbumListener('first', []);
      const second: AlbumListener = new AlbumListener('second', []);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(0);
      expect(first.deleteCount).assertEqual(1);
      expect(second.deleteCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1332
     * @tc.name    AlbumExtension1332
     * @tc.desc    Move notification preserves both positions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyMove_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 3));
      const listener: AlbumListener = new AlbumListener('move', []);
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      expect(listener.moveCount).assertEqual(1);
      expect(listener.lastMoveFrom).assertEqual(1);
      expect(listener.lastMoveTo).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1333
     * @tc.name    AlbumExtension1333
     * @tc.desc    Mixed notifications keep one counter per call
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyMixed_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const listener: AlbumListener = new AlbumListener('mixed', []);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 1);
      source.notifyDataAdd(0);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.changeCount).assertEqual(1);
      expect(listener.deleteCount).assertEqual(1);
      expect(listener.moveCount).assertEqual(1);
      expect(listener.addCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1334
     * @tc.name    AlbumExtension1334
     * @tc.desc    Notifying without listeners keeps the data unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyNoListener_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 1);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).id).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1335
     * @tc.name    AlbumExtension1335
     * @tc.desc    Pushing the same track twice keeps two sharing entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicatePush_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const track: SongItem = makeTrack(1, 'same');
      source.pushData(track);
      source.pushData(track);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0) === source.getData(1)).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1336
     * @tc.name    AlbumExtension1336
     * @tc.desc    Negative insertion index places the track before the last one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addNegativeIndex_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(-1, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).title).assertEqual('a');
      expect(source.getData(1).title).assertEqual('x');
      expect(source.getData(2).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1337
     * @tc.name    AlbumExtension1337
     * @tc.desc    Insertion at the current length appends the track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addAtLength_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(2, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('x');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1338
     * @tc.name    AlbumExtension1338
     * @tc.desc    Insertion beyond the current length appends at the end
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addBeyondLength_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(9, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('x');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1339
     * @tc.name    AlbumExtension1339
     * @tc.desc    Out of range read reports undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'dataOutOfRange_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const beyond: SongItem | undefined = source.getData(2);
      const before: SongItem | undefined = source.getData(-1);
      expect(beyond === undefined).assertTrue();
      expect(before === undefined).assertTrue();
      expect(source.totalCount()).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1340
     * @tc.name    AlbumExtension1340
     * @tc.desc    Empty constructor starts with zero tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptySource_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      expect(source.totalCount()).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1341
     * @tc.name    AlbumExtension1341
     * @tc.desc    Push into an empty source notifies index zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptyPush_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const listener: AlbumListener = new AlbumListener('empty', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(1, 'a'));
      expect(source.totalCount()).assertEqual(1);
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1342
     * @tc.name    AlbumExtension1342
     * @tc.desc    Three listeners are notified in registration order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listenerOrderThree_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const log: string[] = [];
      source.registerDataChangeListener(new AlbumListener('a', log));
      source.registerDataChangeListener(new AlbumListener('b', log));
      source.registerDataChangeListener(new AlbumListener('c', log));
      source.pushData(makeTrack(2, 'b'));
      expect(log.length).assertEqual(3);
      expect(log[0]).assertEqual('a:add');
      expect(log[1]).assertEqual('b:add');
      expect(log[2]).assertEqual('c:add');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1343
     * @tc.name    AlbumExtension1343
     * @tc.desc    Track mutation changes VIP count and singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'trackMutation_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const beforeVip: number = model.countVip();
      const beforeSinger: number = model.singerCount();
      model.getTracks()[0].label = 'ic_vip';
      model.getTracks()[1].singer = 'brand-new';
      expect(model.countVip()).assertEqual(beforeVip + 1);
      expect(model.singerCount()).assertEqual(beforeSinger + 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1344
     * @tc.name    AlbumExtension1344
     * @tc.desc    Negative page index yields an empty album page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pageNegative_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(-1, 5).length).assertEqual(0);
      expect(model.slicePage(-3, 30).length).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1345
     * @tc.name    AlbumExtension1345
     * @tc.desc    Sliced album page is a copy of the backing list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pageCopy_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 3);
      page.push({ id: 99, title: 'extra', singer: 'none', label: 'ic_SQ' });
      expect(page.length).assertEqual(4);
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1346
     * @tc.name    AlbumExtension1346
     * @tc.desc    Only the first and the twelfth source tracks are VIP
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sourceVipIndices_001', 0, () => {
      const vipId: number = songList[0].label.id;
      expect(songList[11].label.id).assertEqual(vipId);
      expect(songList[1].label.id === vipId).assertFalse();
      expect(songList[21].label.id === vipId).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1347
     * @tc.name    AlbumExtension1347
     * @tc.desc    Unregistering an unknown listener leaves other listeners active
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'unregisterUnknown_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const active: AlbumListener = new AlbumListener('active', []);
      const stranger: AlbumListener = new AlbumListener('stranger', []);
      source.registerDataChangeListener(active);
      source.unregisterDataChangeListener(stranger);
      source.notifyDataChange(0);
      expect(active.changeCount).assertEqual(1);
      expect(stranger.changeCount).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1348
     * @tc.name    AlbumExtension1348
     * @tc.desc    Sequential pushes report the growing append index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushIndexSequence_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('push', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      source.pushData(makeTrack(3, 'c'));
      expect(source.totalCount()).assertEqual(3);
      expect(listener.addCount).assertEqual(2);
      expect(listener.lastAddIndex).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1349
     * @tc.name    AlbumExtension1349
     * @tc.desc    Insertion at the front moves the original head to index one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'insertFront_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(0, makeTrack(9, 'front'));
      expect(source.getData(0).title).assertEqual('front');
      expect(source.getData(1).title).assertEqual('a');
      expect(source.getData(2).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1350
     * @tc.name    AlbumExtension1350
     * @tc.desc    Push into a three entry source reports index three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushTailIndex_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      const listener: AlbumListener = new AlbumListener('tail', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(4, 'd'));
      expect(listener.lastAddIndex).assertEqual(3);
      expect(source.getData(3).title).assertEqual('d');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1351
     * @tc.name    AlbumExtension1351
     * @tc.desc    Direct add notification keeps the stored data untouched
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'directAddNotify_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('direct', []);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(5);
      expect(source.totalCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1352
     * @tc.name    AlbumExtension1352
     * @tc.desc    Repeated reads of one index return the same stored object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'readIdentity_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      expect(source.getData(0) === source.getData(0)).assertTrue();
      expect(source.getData(1).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1353
     * @tc.name    AlbumExtension1353
     * @tc.desc    Appending a track raises the model count and enables lookup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelPushTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = { id: 99, title: 'extra', singer: 'none', label: 'ic_SQ' };
      model.getTracks().push(track);
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT + 1);
      expect(model.getTrackById(99) === track).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1354
     * @tc.name    AlbumExtension1354
     * @tc.desc    The first identifier after the gap maps to track twenty two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idGapFirstAfter_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const first: AlbumTrack | undefined = model.getTrackById(23);
      expect(first !== undefined).assertTrue();
      expect((first as AlbumTrack).title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1355
     * @tc.name    AlbumExtension1355
     * @tc.desc    The second identifier after the gap maps to track twenty three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idGapSecondAfter_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const second: AlbumTrack | undefined = model.getTrackById(24);
      expect(second !== undefined).assertTrue();
      expect((second as AlbumTrack).title).assertEqual('track23');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1356
     * @tc.name    AlbumExtension1356
     * @tc.desc    The final identifier maps to the last generated track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idFinalTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const last: AlbumTrack | undefined = model.getTrackById(25);
      expect(last !== undefined).assertTrue();
      expect((last as AlbumTrack).title).assertEqual('track24');
      expect((last as AlbumTrack).id).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1357
     * @tc.name    AlbumExtension1357
     * @tc.desc    An empty breakpoint falls back to the medium margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginEmptyFallback_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1358
     * @tc.name    AlbumExtension1358
     * @tc.desc    The large breakpoint uses the published large font
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontLargeExact_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('lg')).assertEqual(ALBUM_FONT_LG);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1359
     * @tc.name    AlbumExtension1359
     * @tc.desc    The small breakpoint uses the published small margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginSmallExact_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('sm')).assertEqual(ALBUM_MARGIN_SM);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1360
     * @tc.name    AlbumExtension1360
     * @tc.desc    Appending an option raises the option count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionCountAfterPush_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().push({ key: 'extra', text: 'extra' });
      expect(model.getOptionCount()).assertEqual(ALBUM_OPTION_COUNT + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1361
     * @tc.name    AlbumExtension1361
     * @tc.desc    Flipping one label to VIP raises the VIP count to five
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'vipAfterLabelFlip_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[0].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1362
     * @tc.name    AlbumExtension1362
     * @tc.desc    Collapsing every singer to one name shrinks the singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'singerCollapse_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        track.singer = 'x';
      });
      expect(model.singerCount()).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1363
     * @tc.name    AlbumExtension1363
     * @tc.desc    One page sized like the album returns every track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceFullAlbum_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, ALBUM_TRACK_COUNT);
      expect(page.length).assertEqual(ALBUM_TRACK_COUNT);
      expect(page[0].title).assertEqual('track1');
      expect(page[ALBUM_TRACK_COUNT - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1364
     * @tc.name    AlbumExtension1364
     * @tc.desc    A zero page size returns no album track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceZeroSize_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(0, 0).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1365
     * @tc.name    AlbumExtension1365
     * @tc.desc    The second single sized page starts at track two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceSecondSingle_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(1, 1)[0].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1366
     * @tc.name    AlbumExtension1366
     * @tc.desc    A half track page size yields forty eight pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesHalfTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(0.5)).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1367
     * @tc.name    AlbumExtension1367
     * @tc.desc    A page size at or above the album yields one page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesFullAlbum_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(ALBUM_TRACK_COUNT)).assertEqual(1);
      expect(model.totalPages(ALBUM_TRACK_COUNT + 1)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1368
     * @tc.name    AlbumExtension1368
     * @tc.desc    Duplicating an identifier breaks id uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueAfterDuplicateId_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[1].id = model.getTracks()[0].id;
      expect(model.hasUniqueIds()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1369
     * @tc.name    AlbumExtension1369
     * @tc.desc    The first track keeps its id, title, singer and standard label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'firstTrackFields_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[0];
      expect(track.id).assertEqual(1);
      expect(track.title).assertEqual('track1');
      expect(track.singer).assertEqual('singer1');
      expect(track.label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1370
     * @tc.name    AlbumExtension1370
     * @tc.desc    The last track keeps the shifted id and VIP label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lastTrackFields_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[23];
      expect(track.id).assertEqual(25);
      expect(track.title).assertEqual('track24');
      expect(track.singer).assertEqual('singer4');
      expect(track.label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1371
     * @tc.name    AlbumExtension1371
     * @tc.desc    Registering one listener twice still yields one notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateListenerRegistration_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('dup', []);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      expect(source.totalCount()).assertEqual(2);
      expect(listener.addCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1372
     * @tc.name    AlbumExtension1372
     * @tc.desc    A fractional read index reports undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fractionalReadUndefined_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const got: SongItem | undefined = source.getData(1.5);
      expect(got === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1373
     * @tc.name    AlbumExtension1373
     * @tc.desc    An appended option lands at the next option slot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionKeyAfterPush_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().push({ key: 'extra', text: 'x' });
      expect(model.getOptions()[ALBUM_OPTION_COUNT].key).assertEqual('extra');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1374
     * @tc.name    AlbumExtension1374
     * @tc.desc    Mixed case breakpoint names fall back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontUnknownCase_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('Md')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('lG')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1375
     * @tc.name    AlbumExtension1375
     * @tc.desc    Track 1 exposes the shifted identifier 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].id).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1376
     * @tc.name    AlbumExtension1376
     * @tc.desc    Track 1 exposes the generated title track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1377
     * @tc.name    AlbumExtension1377
     * @tc.desc    Track 1 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1378
     * @tc.name    AlbumExtension1378
     * @tc.desc    Track 1 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1379
     * @tc.name    AlbumExtension1379
     * @tc.desc    Track 1 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[0];
      expect(track.id).assertEqual(1);
      expect(track.title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1380
     * @tc.name    AlbumExtension1380
     * @tc.desc    Identifier 1 resolves back to track 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(1);
      expect(found === model.getTracks()[0]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1381
     * @tc.name    AlbumExtension1381
     * @tc.desc    Track 2 exposes the shifted identifier 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1382
     * @tc.name    AlbumExtension1382
     * @tc.desc    Track 2 exposes the generated title track2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1383
     * @tc.name    AlbumExtension1383
     * @tc.desc    Track 2 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1384
     * @tc.name    AlbumExtension1384
     * @tc.desc    Track 2 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1385
     * @tc.name    AlbumExtension1385
     * @tc.desc    Track 2 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[1];
      expect(track.id).assertEqual(2);
      expect(track.title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1386
     * @tc.name    AlbumExtension1386
     * @tc.desc    Identifier 2 resolves back to track 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(2);
      expect(found === model.getTracks()[1]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1387
     * @tc.name    AlbumExtension1387
     * @tc.desc    Track 3 exposes the shifted identifier 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].id).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1388
     * @tc.name    AlbumExtension1388
     * @tc.desc    Track 3 exposes the generated title track3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1389
     * @tc.name    AlbumExtension1389
     * @tc.desc    Track 3 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1390
     * @tc.name    AlbumExtension1390
     * @tc.desc    Track 3 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1391
     * @tc.name    AlbumExtension1391
     * @tc.desc    Track 3 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[2];
      expect(track.id).assertEqual(3);
      expect(track.title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1392
     * @tc.name    AlbumExtension1392
     * @tc.desc    Identifier 3 resolves back to track 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(3);
      expect(found === model.getTracks()[2]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1393
     * @tc.name    AlbumExtension1393
     * @tc.desc    Track 4 exposes the shifted identifier 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].id).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1394
     * @tc.name    AlbumExtension1394
     * @tc.desc    Track 4 exposes the generated title track4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1395
     * @tc.name    AlbumExtension1395
     * @tc.desc    Track 4 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1396
     * @tc.name    AlbumExtension1396
     * @tc.desc    Track 4 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1397
     * @tc.name    AlbumExtension1397
     * @tc.desc    Track 4 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[3];
      expect(track.id).assertEqual(4);
      expect(track.title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1398
     * @tc.name    AlbumExtension1398
     * @tc.desc    Identifier 4 resolves back to track 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(4);
      expect(found === model.getTracks()[3]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1399
     * @tc.name    AlbumExtension1399
     * @tc.desc    Track 5 exposes the shifted identifier 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].id).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1400
     * @tc.name    AlbumExtension1400
     * @tc.desc    Track 5 exposes the generated title track5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].title).assertEqual('track5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1401
     * @tc.name    AlbumExtension1401
     * @tc.desc    Track 5 exposes the singer singer0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].singer).assertEqual('singer0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1402
     * @tc.name    AlbumExtension1402
     * @tc.desc    Track 5 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1403
     * @tc.name    AlbumExtension1403
     * @tc.desc    Track 5 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[4];
      expect(track.id).assertEqual(5);
      expect(track.title).assertEqual('track5');
    })
