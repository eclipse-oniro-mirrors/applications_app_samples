/**
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

import { PinYinService } from './PinYinService';
import { StringBuffer } from './StringBuffer';
import { resourceManager } from '@kit.LocalizationKit';

export enum ImeState {
  STATE_BYPASS, STATE_IDLE, STATE_INPUT, STATE_COMPOSING, STATE_PREDICT,
  STATE_APP_COMPLETION
}

export class DecodingInfo {
  /**
   * 拼音字符串的最大长度
   */
  private PY_STRING_MAX: number = 28;
  /**
   * 一页显示的最多候选词数
   */
  private MAX_PAGE_SIZE_DISPLAY: number = 200;
  /**
   * 显示选项的总数。列表可能只包含第一部分。
   * 如果用户试图导航到下一页，需要获取这些项来判断下一页是否在列表中。
   **/
  public mTotalChoicesNum: number = 0;
  /**
   * 候选词列表，第一个是完整句子的候选者。
   */
  public mCandidatesList: string[] = [];
  /**
   * 元素i存储了第i页的起始位置。
   */
  public mPageStart: number[] = [];
  /**
   * 元素i存储第i页的字符数。
   */
  public mCnToPage: number[] = [];
  /**
   * 在拼音字符串中要删除的位置。
   * 如果它小于0， IME将执行增量搜索，否则IME将执行删除操作。
   * 如果{@link #mIsPosInSpl}为真，IME将删除mPosDelSpl-th拼写的整个字符串，
   * 否则只会删除拼音字符串中的mPosDelSpl-th字符。
   */
  public mPosDelSpl: number = -1;
  /**
   * 如果{@link #mPosDelSpl}大于等于0，
   * 意在指示mPosDelSpl用于拼写id或字符中。
   */
  public mIsPosInSpl: boolean = false;
  /**
   * 拼写(拼音)字符串。
   * StringBuffer
   */
  private mSurface: StringBuffer;
  /**
   * 字节缓冲区用作本地函数调用的拼音字符串参数。
   */
  private mPyBuf: string[] = [];
  /**
   * 编码成功的字符串长度
   */
  private mSurfaceDecodedLen: number;
  /**
   * 合成字符串。
   */
  private mComposingStr: string = '';
  /**
   * 合成字符串长度
   */
  private mActiveCmpsLen: number = 0;
  /**
   * 用于显示的合成字符串，它复制自mComposingStr，并在拼写之间添加空格。
   **/
  private mComposingStrDisplay: string = '';
  /**
   * 用于显示的合成字符串长度
   */
  private mActiveCmpsDisplayLen: number = 0;
  /**
   * 第一个完整的句子选择。
   */
  private mFullSent: string = '';
  /**
   * 固定的字符数。
   */
  private mFixedLen: number = 0;
  /**
   * 如果标志为真，完成选择。
   */
  private mFinishSelection: boolean = false;
  /**
   * 每个拼写的起始位置。第一个是实际起始位置元素的数量。
   */
  private mSplStart: number[] = [];
  /**
   * 在mSurface中编辑光标。
   */
  private mCursorPos: number = 0;
  /**
   * 应用建议的复杂信息。
   * CompletionInfo
   */
  private mAppCompletions: string[] = [];
  public mImeState: ImeState = ImeState.STATE_IDLE;

  constructor() {
    this.mSurface = new StringBuffer();
    this.mSurfaceDecodedLen = 0;
  }

  public initPinyin(descriptor: resourceManager.RawFileDescriptor, filePath: string) {
    try {
      PinYinService.pinYinService.setRawFileDescriptor(descriptor);
      PinYinService.pinYinService.setFilePath(filePath);
      PinYinService.pinYinService.initPinyinEngine();
    } catch (e) {
      PinYinService.pinYinService.addLog('initPinyinEngine failed');
    }
  }

  public destroyPinyin() {
    PinYinService.pinYinService.destroyEngine();
  }

  public reset() {
    this.mSurface.delete(0, this.mSurface.length());
    this.mSurfaceDecodedLen = 0;
    this.mCursorPos = 0;
    this.mFullSent = '';
    this.mFixedLen = 0;
    this.mFinishSelection = false;
    this.mComposingStr = '';
    this.mComposingStrDisplay = '';
    this.mActiveCmpsLen = 0;
    this.mActiveCmpsDisplayLen = 0;
    this.mPyBuf = [];

    this.resetCandidates();
  }

  public isCandidatesListEmpty(): boolean {
    return this.mCandidatesList.length === 0;
  }

  public isSplStrFull(): boolean {
    if (this.mSurface.length() >= this.PY_STRING_MAX - 1) {
      return true;
    }
    return false;
  }

  public addSplChar(ch: string, reset: boolean) {
    if (reset) {
      this.mSurface.clear();
      this.mSurfaceDecodedLen = 0;
      this.mCursorPos = 0;
      try {
        PinYinService.pinYinService.imResetSearch();
      } catch (e) {
      }
    }
    this.mSurface.insert(this.mCursorPos, ch);
    this.mCursorPos++;
  }

  // Prepare to delete before cursor. We may delete a spelling char if
  // the cursor is in the range of unfixed part, delete a whole spelling
  // if the cursor in inside the range of the fixed part.
  // This function only marks the position used to delete.
  public prepareDeleteBeforeCursor() {
    if (this.mCursorPos > 0) {
      let pos: number;
      for (pos = 0; pos < this.mFixedLen; pos++) {
        if (this.mSplStart[pos + 2] >= this.mCursorPos &&
          this.mSplStart[pos + 1] < this.mCursorPos) {
          this.mPosDelSpl = pos;
          this.mCursorPos = this.mSplStart[pos + 1];
          this.mIsPosInSpl = true;
          break;
        }
      }
      if (this.mPosDelSpl < 0) {
        this.mPosDelSpl = this.mCursorPos - 1;
        this.mCursorPos--;
        this.mIsPosInSpl = false;
      }
    }
  }

  public length(): number {
    return this.mSurface.length();
  }

  public charAt(index: number): string {
    return this.mSurface.charAt(index);
  }

  public getOrigianlSplStr(): string {
    return this.mSurface.buffer();
  }

  public getSplStrDecodedLen(): number {
    return this.mSurfaceDecodedLen;
  }

  public getSplStart(): number[] {
    return this.mSplStart;
  }

  public getComposingStr(): string {
    return this.mComposingStr;
  }

  public getComposingStrActivePart(): string {
    if (this.mActiveCmpsLen <= this.mComposingStr.length) {
      return this.mComposingStr.substring(0, this.mActiveCmpsLen);
    }
    return '';
  }

  public getActiveCmpsLen(): number {
    return this.mActiveCmpsLen;
  }

  public getComposingStrForDisplay(): string {
    return this.mComposingStrDisplay;
  }

  public getActiveCmpsDisplayLen(): number {
    return this.mActiveCmpsDisplayLen;
  }

  public getFullSent(): string {
    return this.mFullSent;
  }

  public getCurrentFullSent(activeCandPos: number): string {
    try {
      let retStr = this.mFullSent.substring(0, this.mFixedLen);
      retStr += this.mCandidatesList[activeCandPos];
      return retStr;
    } catch (e) {
      return '';
    }
  }

  public resetCandidates() {
    this.mCandidatesList.splice(0);
    this.mTotalChoicesNum = 0;

    this.mPageStart.splice(0);
    this.mPageStart.push(0);
    this.mCnToPage.splice(0);
    this.mCnToPage.push(0);
  }

  public candidatesFromApp(): boolean {
    return ImeState.STATE_APP_COMPLETION === this.mImeState;
  }

  public canDoPrediction(): boolean {
    return this.mComposingStr.length === this.mFixedLen;
  }

  public selectionFinished(): boolean {
    return this.mFinishSelection;
  }

  // After the user chooses a candidate, input method will do a re-decoding and give the new candidate list.
  // If candidate id is less than 0, means user is inputting Pinyin, not selecting any choice.
  public chooseDecodingCandidate(candId: number) {
    if (this.mImeState === ImeState.STATE_PREDICT) {
      return;
    }
    this.resetCandidates();
    let totalChoicesNum = 0;
    try {
      totalChoicesNum = candId < 0 ? this.searchCandidates() : PinYinService.pinYinService.imChoose(candId);
    } catch (e) {
    }
    this.updateDecInfoForSearch(totalChoicesNum);
  }

  private searchCandidates(): number {
    if (this.length() === 0) {
      return 0;
    }
    if (this.mPyBuf == null) {
      this.mPyBuf = [];
    }
    for (let i = 0; i < this.length(); i++) {
      this.mPyBuf[i] = this.charAt(i);
    }
    this.mPyBuf[this.length()] = '';
    if (this.mPosDelSpl < 0) {
      return PinYinService.pinYinService.imSearch(this.mPyBuf.join(''), this.length());
    }
    const clearFixedThisStep = this.mImeState !== ImeState.STATE_COMPOSING;
    const totalChoicesNum = PinYinService.pinYinService.imDelSearch(this.mPosDelSpl,
      this.mIsPosInSpl, clearFixedThisStep);
    this.mPosDelSpl = -1;
    return totalChoicesNum;
  }


  private updateDecInfoForSearch(totalChoicesNum: number) {
    this.mTotalChoicesNum = totalChoicesNum;
    if (this.mTotalChoicesNum < 0) {
      this.mTotalChoicesNum = 0;
      return;
    }
    try {
      const pyStr = PinYinService.pinYinService.imGetPyStr(false);
      this.mSplStart = PinYinService.pinYinService.imGetSplStart();
      this.mSurfaceDecodedLen = PinYinService.pinYinService.imGetPyStrLen(true);
      if (this.mSurfaceDecodedLen <= pyStr.length) {
        this.applyDecodedPyStr(pyStr);
      }
    } catch (e) {
      this.mTotalChoicesNum = 0;
      this.mComposingStr = '';
    }
    if (!this.mFinishSelection) {
      this.preparePage(0);
    }
  }

  private applyDecodedPyStr(pyStr: string): void {
    this.mFullSent = PinYinService.pinYinService.imGetChoice(0);
    this.mFixedLen = PinYinService.pinYinService.imGetFixedLen();
    this.mSurface.replace(0, this.mSurface.length(), pyStr);
    if (this.mCursorPos > this.mSurface.length()) {
      this.mCursorPos = this.mSurface.length();
    }
    this.mComposingStr = this.mFullSent.substring(0, this.mFixedLen) +
      this.mSurface.substr(this.mSplStart[this.mFixedLen + 1]);
    this.mActiveCmpsLen = this.mComposingStr.length;
    if (this.mSurfaceDecodedLen > 0) {
      this.mActiveCmpsLen = this.mActiveCmpsLen -
        (this.mSurface.length() - this.mSurfaceDecodedLen);
    }
    this.prepareDisplayString();
    this.mFinishSelection = this.mSplStart.length === this.mFixedLen + 2;
  }

  private prepareDisplayString(): void {
    if (this.mSurfaceDecodedLen === 0) {
      this.mComposingStrDisplay = this.mComposingStr;
      this.mActiveCmpsDisplayLen = this.mComposingStr.length;
      return;
    }
    this.mComposingStrDisplay = this.mFullSent.substr(0, this.mFixedLen);
    for (let pos = this.mFixedLen + 1; pos < this.mSplStart.length - 1; pos++) {
      this.mComposingStrDisplay += this.mSurface.substr(this.mSplStart[pos], this.mSplStart[pos + 1]);
      if (this.mSplStart[pos + 1] < this.mSurfaceDecodedLen) {
        this.mComposingStrDisplay += ' ';
      }
    }
    this.mActiveCmpsDisplayLen = this.mComposingStrDisplay.length;
    if (this.mSurfaceDecodedLen < this.mSurface.length()) {
      this.mComposingStrDisplay += this.mSurface.substr(this.mSurfaceDecodedLen);
    }
  }


  public choosePredictChoice(choiceId: number) {
    if (ImeState.STATE_PREDICT !== this.mImeState || choiceId < 0 ||
      choiceId >= this.mTotalChoicesNum) {
      return;
    }

    let tmp = this.mCandidatesList[choiceId];

    this.resetCandidates();

    this.mCandidatesList.push(tmp);
    this.mTotalChoicesNum = 1;

    this.mCursorPos = 0;
    this.mFullSent = tmp;
    this.mFixedLen = tmp.length;
    this.mComposingStr = this.mFullSent;
    this.mActiveCmpsLen = this.mFixedLen;

    this.mFinishSelection = true;
  }

  public getCandidate(candId: number): string {
    // 只加载得到的项，因此我们使用mCandidatesList.size()，而不是mTotalChoiceNum。
    if (candId < 0 || candId > this.mCandidatesList.length) {
      return '';
    }
    return this.mCandidatesList[candId];
  }

  private getCandiagtesForCache() {
    const fetchStart = this.mCandidatesList.length;
    const fetchSize = Math.min(this.mTotalChoicesNum - fetchStart, this.MAX_PAGE_SIZE_DISPLAY);
    try {
      const newList = this.fetchCandidates(fetchStart, fetchSize);
      newList.forEach((value: string) => {
        this.mCandidatesList.push(value);
      });
    } catch (e) {
    }
  }

  private fetchCandidates(fetchStart: number, fetchSize: number): string[] {
    if (ImeState.STATE_INPUT === this.mImeState ||
      ImeState.STATE_IDLE === this.mImeState ||
      ImeState.STATE_COMPOSING === this.mImeState) {
      return PinYinService.pinYinService.imGetChoiceList(fetchStart, fetchSize, this.mFixedLen);
    }
    if (ImeState.STATE_PREDICT === this.mImeState) {
      return PinYinService.pinYinService.imGetPredictList(fetchStart, fetchSize);
    }
    return [];
  }


  public pageReady(pageNo: number): boolean {
    // 如果页码小于0，则返回false
    if (pageNo < 0) {
      return false;
    }
    // 页面pageNo的信息未准备好。
    if (this.mPageStart.length <= pageNo + 1) {
      return false;
    }
    return true;
  }

  public preparePage(pageNo: number): boolean {
    // 如果页码小于0，则返回false
    if (pageNo < 0) {
      return false;
    }

    // 确保页面pageNo的起始信息已经准备好。
    if (this.mPageStart.length <= pageNo) {
      return false;
    }

    // 页面的结束信息也准备好了。
    if (this.mPageStart.length > pageNo + 1) {
      return true;
    }

    // 缓存项是否有足够的页码。
    if (this.mCandidatesList.length - this.mPageStart[pageNo] >= this.MAX_PAGE_SIZE_DISPLAY) {
      return true;
    }

    // 试着从引擎中获得更多的物品
    this.getCandiagtesForCache();

    // 试着找出是否有可用的新项目来展示。
    // 如果没有新项，返回false;
    if (this.mPageStart[pageNo] >= this.mCandidatesList.length) {
      return false;
    }

    // 如果有新项，返回true;
    return true;
  }

  // CharSequence
  public preparePredicts(history: string) {
    if (null == history) {
      return;
    }

    this.resetCandidates();
    if (true) {
      if (null != history) {
        try {
          this.mTotalChoicesNum = PinYinService.pinYinService.imGetPredictsNum(history);
        } catch (e) {
          return;
        }
      }
    }
    this.preparePage(0);
    this.mFinishSelection = false;
  }

  public getCurrentPageSize(currentPage: number): number {
    if (this.mPageStart.length <= currentPage + 1) {
      return 0;
    }
    return this.mPageStart[currentPage + 1] - this.mPageStart[currentPage];
    return 0;
  }

  public getCurrentPageStart(currentPage: number): number {
    if (this.mPageStart.length < currentPage + 1) {
      return this.mTotalChoicesNum;
    }
    return this.mPageStart[currentPage];
    return 0;
  }

  public pageForwardable(currentPage: number): boolean {
    if (this.mPageStart.length <= currentPage + 1) {
      return false;
    }
    if (this.mPageStart[currentPage + 1] >= this.mTotalChoicesNum) {
      return false;
    }
    return true;
  }

  public pageBackwardable(currentPage: number): boolean {
    if (currentPage > 0) {
      return true;
    }
    return false;
  }

  public charBeforeCursorIsSeparator(): boolean {
    let len = this.mSurface.length();
    if (this.mCursorPos > len) {
      return false;
    }
    if (this.mCursorPos > 0 && this.mSurface.charAt(this.mCursorPos - 1) === '\'') {
      return true;
    }
    return false;
  }

  public getCursorPos(): number {
    return this.mCursorPos;
  }

  public getCursorPosInCmps(): number {
    let cursorPos = this.mCursorPos;

    for (let hzPos = 0; hzPos < this.mFixedLen; hzPos++) {
      if (this.mCursorPos >= this.mSplStart[hzPos + 2]) {
        cursorPos -= this.mSplStart[hzPos + 2] - this.mSplStart[hzPos + 1];
        cursorPos += 1;
      }
    }
    return cursorPos;
  }

  public getCursorPosInCmpsDisplay(): number {
    let cursorPos = this.getCursorPosInCmps();
    // +2的原因: one for mSplStart[0], which is used for other purpose(The length of the segmentation string),
    // and another for the first spelling which does not need a space before it.
    for (let pos = this.mFixedLen + 2; pos < this.mSplStart.length - 1; pos++) {
      if (this.mCursorPos <= this.mSplStart[pos]) {
        break;
      } else {
        cursorPos++;
      }
    }
    return cursorPos;
  }

  public moveCursorToEdge(left: boolean) {
    if (left) {
      this.mCursorPos = 0;
    } else {
      this.mCursorPos = this.mSurface.length();
    }
  }

  // 移动光标。如果offset为0，则函数将游标调整到字符串的边界。
  public moveCursor(offset: number) {
    if (offset > 1 || offset < -1) {
      return;
    }
    if (offset !== 0) {
      offset = this.computeCursorOffset(offset);
    }
    this.mCursorPos += offset;
    if (this.mCursorPos < 0) {
      this.mCursorPos = 0;
    } else if (this.mCursorPos > this.mSurface.length()) {
      this.mCursorPos = this.mSurface.length();
    }
  }

  private computeCursorOffset(offset: number): number {
    for (let hzPos = 0; hzPos <= this.mFixedLen; hzPos++) {
      if (this.mCursorPos !== this.mSplStart[hzPos + 1]) {
        continue;
      }
      if (offset < 0) {
        return hzPos > 0 ? this.mSplStart[hzPos] - this.mSplStart[hzPos + 1] : offset;
      }
      return hzPos < this.mFixedLen ? this.mSplStart[hzPos + 2] - this.mSplStart[hzPos + 1] : offset;
    }
    return offset;
  }


  public getSplNum(): number {
    return this.mSplStart[0];
  }

  public getFixedLen(): number {
    return this.mFixedLen;
  }
}
