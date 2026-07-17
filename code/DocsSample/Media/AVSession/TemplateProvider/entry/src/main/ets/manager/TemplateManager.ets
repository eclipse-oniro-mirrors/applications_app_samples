/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

// [Start manager_create_template]
// [Start template_register_listener]
// [Start set_user_info]
// [Start unregister_listener]
import { avMusicTemplate } from '@kit.AVSessionKit';
// [StartExclude manager_create_template]
// [StartExclude template_register_listener]
// [StartExclude set_user_info]
// [StartExclude unregister_listener]
import { wantAgent } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [EndExclude manager_create_template]
// [EndExclude template_register_listener]
// [EndExclude set_user_info]
// [EndExclude unregister_listener]

export class TemplateManager {
  private template: avMusicTemplate.AVMusicTemplate | undefined = undefined;
  // [StartExclude template_register_listener]
  // [StartExclude set_user_info]
  // [StartExclude unregister_listener]
  private static sInstance: TemplateManager;
  // [EndExclude set_user_info]
  // [StartExclude manager_create_template]
  private isLogin: boolean = false;
  // [EndExclude template_register_listener]
  // [StartExclude set_user_info]
  private queryMainTabsEvent: avMusicTemplate.QueryMainTabsEvent = async () => {
    return this.handlePromiseReturnFunc(() => this.getMainTabs(), 'queryMainTabsEvent');
  };
  private queryMediaTabContentEvent: avMusicTemplate.QueryMediaTabContentEvent = async (tabId: string) => {
    return this.handlePromiseReturnFunc(() => this.createMediaTabContent(), 'queryMediaTabContentEvent');
  };
  // [StartExclude template_register_listener]
  private queryMediaEntityEvent: avMusicTemplate.QueryMediaEntityEvent =
    async (params: avMusicTemplate.QueryMediaEntityParam) => {
      return this.handlePromiseReturnFunc(() => this.createPageMediaEntity(), 'queryMediaEntityEvent');
    };
  private queryCompilationEvent: avMusicTemplate.QueryCompilationEvent =
    async (compilationId: string, pageIndex: number) => {
      return this.handlePromiseReturnFunc(() => this.createPageMediaEntity(), 'queryCompilationEvent');
    };
  private queryPlaylistEvent: avMusicTemplate.QueryPlaylistEvent =
    async (pageIndex: number, sort: avMusicTemplate.Sort) => {
      return this.handlePromiseReturnFunc(() => this.createPageMediaEntity(), 'queryPlaylistEvent');
    };
  private queryCurrentSingleEvent: avMusicTemplate.QueryCurrentSingleEvent = async () => {
    return this.handlePromiseReturnFunc(() => this.createCurrentSingle(), 'queryCurrentSingleEvent');
  };
  private queryCompilationByKeywordEvent: avMusicTemplate.QueryCompilationByKeywordEvent = async (keyword: string) => {
    return this.handlePromiseArrayReturnFunc(() => this.createCompilation(), 'queryCompilationByKeywordEvent');
  };
  private queryMediaEntityByKeywordEvent: avMusicTemplate.QueryMediaEntityByKeywordEvent =
    async (keyword: string, searchType: avMusicTemplate.EntityType, pageIndex: number) => {
      return this.handlePromiseReturnFunc(() => this.createPageMediaEntity(), 'queryMediaEntityByKeywordEvent');
    };
  private queryRecommendMediaEntityListEvent: avMusicTemplate.QueryRecommendMediaEntityListEvent = async () => {
    return this.handlePromiseArrayReturnFunc(() => this.createMediaEntity(), 'queryRecommendMediaEntityListEvent');
  };
  private queryHotWordsEvent: avMusicTemplate.QueryHotWordsEvent = async () => {
    try {
      return ['热词1', '热词2', '热词3', '热词4', '热词5'];
    } catch (e) {
      const msg = `Failed to queryHotWordsEvent. Code: ${e?.code}`;
      console.error(msg);
      throw e instanceof Error ? e : new Error(e?.message ?? msg);
    }
  };
  private querySearchHistoryEvent: avMusicTemplate.QuerySearchHistoryEvent = async () => {
    try {
      return ['搜索历史1', '搜索历史2', '搜索历史3', '搜索历史4', '搜索历史5'];
    } catch (e) {
      const msg = `Failed to querySearchHistoryEvent. Code: ${e?.code}`;
      console.error(msg);
      throw e instanceof Error ? e : new Error(e?.message ?? msg);
    }
  };
  private clearSearchHistoryEvent: avMusicTemplate.ClearSearchHistoryEvent = async () => {
    return this.handlePromiseReturnFunc(() => this.createOperResult(), 'clearSearchHistoryEvent');
  };
  private loginEvent: avMusicTemplate.LoginEvent = async (controlType: avMusicTemplate.LoginType, id?: string) => {
    return this.handlePromiseArrayReturnFunc(() => this.createQrCodeInfo(), 'loginEvent');
  };
  private requestDialogInfoEvent: avMusicTemplate.RequestDialogInfoEvent =
    async (actionType: avMusicTemplate.DialogActionType, actionInfo?: avMusicTemplate.DialogActionInfo) => {
      return this.handlePromiseReturnFunc(() => this.createDialogInfo(), 'requestDialogInfoEvent');
    };
  private handleMemberPurchaseEvent: avMusicTemplate.HandleMemberPurchaseEvent =
    async (info: avMusicTemplate.MemberPurchaseInfo) => {
      return this.handlePromiseReturnFunc(() => this.createDialogInfo(), 'handleMemberPurchaseEvent');
    };
  private queryMemberPurchaseEvent: avMusicTemplate.QueryMemberPurchaseEvent =
    async (memberPurchaseType: avMusicTemplate.MemberPurchaseType) => {
      return this.handlePromiseArrayReturnFunc(() => this.createQueryMemberPurchase(), 'queryMemberPurchaseEvent');
    };
  private queryCustomContentEvent: avMusicTemplate.QueryCustomContentEvent =
    async (queryTypes: avMusicTemplate.CustomType[]) => {
      return this.handlePromiseReturnFunc(() => this.createCustomContent(), 'queryCustomContentEvent');
    };
  private downloadMediaEntityEvent: avMusicTemplate.DownloadMediaEntityEvent =
    async (controlType: avMusicTemplate.DownloadControlType, mediaEntity: avMusicTemplate.MediaEntity) => {
      try {
        this.downloadMediaEntity(mediaEntity);
        return await this.createOperResult();
      } catch (e) {
        const msg: string = `Failed to downloadMediaEntityEvent. Code: ${e?.code}`;
        console.error(msg);
        throw e instanceof Error ? e : new Error(e?.message ?? msg);
      }
    };
  private settingsChangeEvent: avMusicTemplate.SettingsChangeEvent =
    async (settingItem: avMusicTemplate.SettingItem) => {
      return this.handlePromiseReturnFunc(() => this.settingsChange(), 'settingsChangeEvent');
    };
  private problemAndAdviceEvent: avMusicTemplate.ProblemAndAdviceEvent = async (advice: string) => {
    return this.handlePromiseReturnFunc(() => this.createOperResult(), 'problemAndAdviceEvent');
  };
  private playForSearchEvent: avMusicTemplate.PlayForSearchEvent = async (command: avMusicTemplate.SearchPlayInfoType,
    args: avMusicTemplate.SearchPlayInfo) => {
    return this.handlePromiseReturnFunc(() => this.createOperResult(), 'playForSearchEvent');
  };
  private executeActionEvent: avMusicTemplate.ExecuteActionEvent = async (actionType: string, params: string) => {
    try {
      return 'success';
    } catch (e) {
      const msg: string = `Failed to executeActionEvent. Code: ${e?.code}`;
      console.error(msg);
      throw e instanceof Error ? e : new Error(e?.message ?? msg);
    }
  };
  private playMediaEntityEvent: avMusicTemplate.PlayMediaEntityEvent =
    async (mediaEntity: avMusicTemplate.MediaEntity) => {
      console.info('playMediaEntity');
    };
  private favoriteMediaEntityEvent: avMusicTemplate.FavoriteMediaEntityEvent =
    async (actionType: avMusicTemplate.MediaFavoriteType, mediaEntity: avMusicTemplate.MediaEntity) => {
      return this.handlePromiseReturnFunc(() => this.createOperResult(), 'favoriteMediaEntityEvent');
    };
  // [EndExclude manager_create_template]

  private constructor() {
  }

  /**
   * 获取模板控制器实例。
   *
   * @returns 模板控制器实例。
   */
  public static getInstance(): TemplateManager {
    if (!TemplateManager.sInstance) {
      TemplateManager.sInstance = new TemplateManager();
    }
    return TemplateManager.sInstance;
  };

  /**
   * 创建音频模板。
   */
  public createTemplate() {
    if (this.template) {
      console.warn('createTemplate: template not undefined');
      return
    }
    try {
      this.template = avMusicTemplate.createAVMusicTemplate(avMusicTemplate.AVMusicTemplateType.DEFAULT);
      console.info('createTemplate: success');
      // [StartExclude manager_create_template]
      this.registerListener();
      // [EndExclude manager_create_template]
    } catch (e) {
      console.error(`createTemplate, errCode: ${e?.code}`);
    }
  }
  // [StartExclude manager_create_template]
  // [EndExclude template_register_listener]

  /**
   * 注册监听。
   */
  private registerListener() {
    this.template?.onQueryMainTabs(this.queryMainTabsEvent);
    this.template?.onQueryMediaTabContent(this.queryMediaTabContentEvent);
    // [StartExclude template_register_listener]
    this.template?.onQueryMediaEntity(this.queryMediaEntityEvent);
    this.template?.onQueryCompilation(this.queryCompilationEvent);
    this.template?.onQueryPlaylist(this.queryPlaylistEvent);
    this.template?.onQueryCurrentSingle(this.queryCurrentSingleEvent);
    this.template?.onQueryCompilationByKeyword(this.queryCompilationByKeywordEvent);
    this.template?.onQueryMediaEntityByKeyword(this.queryMediaEntityByKeywordEvent);
    this.template?.onQueryRecommendMediaEntityList(this.queryRecommendMediaEntityListEvent);
    this.template?.onQueryHotWords(this.queryHotWordsEvent);
    this.template?.onQuerySearchHistory(this.querySearchHistoryEvent);
    this.template?.onClearSearchHistory(this.clearSearchHistoryEvent);
    this.template?.onLogin(this.loginEvent);
    this.template?.onRequestDialogInfo(this.requestDialogInfoEvent);
    this.template?.onHandleMemberPurchase(this.handleMemberPurchaseEvent);
    this.template?.onQueryMemberPurchase(this.queryMemberPurchaseEvent);
    this.template?.onQueryCustomContent(this.queryCustomContentEvent);
    this.template?.onDownloadMediaEntity(this.downloadMediaEntityEvent);
    this.template?.onSettingsChange(this.settingsChangeEvent);
    this.template?.onProblemAndAdvice(this.problemAndAdviceEvent);
    this.template?.onPlayForSearch(this.playForSearchEvent);
    this.template?.onExecuteAction(this.executeActionEvent);
    this.template?.onPlayMediaEntity(this.playMediaEntityEvent);
    this.template?.onFavoriteMediaEntity(this.favoriteMediaEntityEvent);
    // [EndExclude template_register_listener]
  };
  // [EndExclude unregister_listener]

  // [StartExclude template_register_listener]
  /**
   * 注销监听。
   */
  public unregisterListener() {
    this.template?.offQueryMainTabs();
    this.template?.offQueryMediaTabContent();
    this.template?.offQueryMediaEntity();
    this.template?.offQueryCompilation();
    this.template?.offQueryPlaylist();
    this.template?.offQueryCurrentSingle();
    this.template?.offQueryCompilationByKeyword();
    this.template?.offQueryMediaEntityByKeyword();
    this.template?.offQueryRecommendMediaEntityList();
    this.template?.offQueryHotWords();
    this.template?.offQuerySearchHistory();
    this.template?.offClearSearchHistory();
    this.template?.offLogin();
    this.template?.offRequestDialogInfo();
    this.template?.offHandleMemberPurchase();
    this.template?.offQueryMemberPurchase();
    this.template?.offQueryCustomContent();
    this.template?.offDownloadMediaEntity();
    this.template?.offSettingsChange();
    this.template?.offProblemAndAdvice();
    this.template?.offPlayForSearch();
    this.template?.offExecuteAction();
    this.template?.offPlayMediaEntity();
    this.template?.offFavoriteMediaEntity();
    this.template?.destroy();
    this.template = undefined;
  };
  // [StartExclude unregister_listener]

  /**
   * 模拟开启模板。
   */
  public startTemplate() {
    this.template?.startTemplate();
  }
  // [EndExclude set_user_info]

  /**
   * 模拟登录状态改变。
   *
   * @param isLogin 是否登录。
   */
  public setLoginState(isLogin: boolean) {
    this.isLogin = isLogin;
    this.setUserInfo();
  }

  /**
   * 用户信息发生变化后通知界面刷新用户信息，如登录账号后。
   */
  public setUserInfo() {
    let userInfo: avMusicTemplate.UserInfo = {
      userInfoId: this.isLogin ? 'userInfoId' : '',
      nickName: this.isLogin ? '昵称' : '',
      profilePicUrl: this.isLogin ? 'profilePicUrl' : '',
      tips: this.isLogin ? 'tips' : '',
      isLogin: this.isLogin,
      isVip: false
    };
    this.template?.setUserInfo(userInfo);
  };
  // [StartExclude set_user_info]

  /**
   * 对话框相关的操作，如：打开，关闭。
   */
  public setDialogCommand() {
    let type: avMusicTemplate.DialogControlType = 'open';
    let qrCodeInfo: avMusicTemplate.QrCodeInfo[] = [{
      id: 'id',
      price: '10',
      titleName: 'title',
      detailName: 'detail',
      tips: 'tip',
      content: 'content',
      validPeriod: 1
    }];
    let dialogInfo: avMusicTemplate.DialogInfo = {
      dialogId: 'dialogId',
      dialogType: avMusicTemplate.DialogType.LOGIN,
      qrCodes: qrCodeInfo
    };
    this.template?.setDialogCommand(type, dialogInfo);
  };

  public async setCurrentSingle() {
    let single: avMusicTemplate.Single = await this.createCurrentSingle()
    this.template?.setCurrentSingle(single);
  };

  /**
   * 媒体播放后信息后，如：歌单的播放状态。
   */
  public setMediaEntities() {
    let mediaEntities: avMusicTemplate.MediaEntity[] = [{
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    }];
    this.template?.setMediaEntities(mediaEntities);
  };

  /**
   * 某个tab页签下的内容发生变化后通知界面刷新。
   */
  public setTabContent() {
    let mediaEntity: avMusicTemplate.MediaEntity[] = [{
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    }]
    let compilation: avMusicTemplate.Compilation[] = [{
      errorCode: 0,
      errorMsg: 'success',
      id: 'id',
      title: 'title',
      hasMoreData: true,
      totalSize: 2,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      topElements: mediaEntity
    }]
    let mediaTabContent: avMusicTemplate.MediaTabContent = {
      errorCode: 0,
      errorMsg: 'success',
      tabId: 'tabId',
      compilations: compilation
    }
    this.template?.setTabContent('tabId', mediaTabContent);
  };

  /**
   * 播放列表发送变化后通知界面刷新。
   */
  public setPlaylist() {
    let mediaEntity: avMusicTemplate.MediaEntity = {
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    }
    let pageMediaEntity: avMusicTemplate.PageMediaEntity = {
      errorCode: 0,
      errorMsg: 'success',
      pageIndex: 0,
      pageSize: 1,
      hasMoreData: true,
      totalSize: 2,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      elements: [mediaEntity]
    }
    this.template?.setPlaylist(pageMediaEntity);
  };

  /**
   * 下载状态，进度刷新。
   */
  public setDownloadMediaEntityStatus(mediaEntity: avMusicTemplate.MediaEntity) {
    this.template?.setDownloadMediaEntityStatus(mediaEntity);
  };

  /**
   * 自定义数据发生变化后通知。
   */
  public setCustomElements() {
    let mediaEntity: avMusicTemplate.MediaEntity = {
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    }
    let compilation: avMusicTemplate.Compilation = {
      errorCode: 0,
      errorMsg: 'success',
      id: 'id',
      title: 'title',
      hasMoreData: true,
      totalSize: 2,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      topElements: [mediaEntity]
    }
    let customElement: avMusicTemplate.CustomElement = {
      errorCode: 0,
      errorMsg: 'success',
      customCompilations: [compilation]
    }
    this.template?.setCustomElements('add', 'COMPILATION', customElement);
  };

  /**
   * 设置项变化后通知。
   */
  public setSettings() {
    let settingItems: avMusicTemplate.SettingItem[] = [{
      id: 'id',
      title: 'title',
      desc: 'desc',
      mediaId: 'mediaId',
      settingType: avMusicTemplate.SettingType.SWITCH,
      settingValue: false
    }];
    this.template?.setSettings(settingItems);
  };

  /**
   * 模拟向媒体中心同步执行操作信息。
   */
  public reportExecuteAction() {
    let actionType: string = 'actionType';
    let params: string = 'params';
    this.template?.reportExecuteAction(actionType, params);
  };

  /**
   * 媒体应用需要拉起应用的自定义界面时调用。
   */
  public setExtensionAbility() {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: 'com.example.templateprovider',
          abilityName: 'EntryAbility',
          type: 'action',
          parameters: {
            'ability.want.params.uiExtensionType': 'action'
          }
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITIES,
      requestCode: 0
    }
    wantAgent.getWantAgent(wantAgentInfo).then((agent) => {
      this.template?.setExtensionAbility(agent);
    }).catch((e: BusinessError) => {
      console.error(`getWantAgent, errCode: ${e?.code}`);
    })
  };

  // [EndExclude template_register_listener]
  /**
   * 模拟获取主界面的所有TAB。
   *
   * @returns Promise类型MediaTab数组。
   */
  private async getMainTabs(): Promise<avMusicTemplate.MediaTab[]> {
    let homeTab: avMusicTemplate.MediaTab = {
      tabId: 'home',
      tabName: '首页'
    };
    let mineTab: avMusicTemplate.MediaTab = {
      tabId: 'mine',
      tabName: '我的'
    };
    let mainTabs: avMusicTemplate.MediaTab[] = [homeTab, mineTab];
    return mainTabs;
  };

  /**
   * 模拟获取TAB内容。
   *
   * @returns 标签页内容。
   */
  private async createMediaTabContent(): Promise<avMusicTemplate.MediaTabContent> {
    let compilation: avMusicTemplate.Compilation = await this.createCompilation();
    let mediaTabContent: avMusicTemplate.MediaTabContent = {
      errorCode: 0,
      tabId: 'tabId',
      compilations: [compilation]
    }
    return mediaTabContent;
  };

  // [EndExclude register_query_compilation_by_keyword]
  /**
   * 模拟获取合集数据。
   *
   * @returns 合集。
   */
  private async createCompilation(): Promise<avMusicTemplate.Compilation> {
    let mediaEntity: avMusicTemplate.MediaEntity = await this.createMediaEntity();
    let compilation: avMusicTemplate.Compilation = {
      errorCode: 0,
      id: '',
      title: '',
      hasMoreData: false,
      totalSize: 1,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      topElements: [mediaEntity],
    }
    return compilation;
  };

  /**
   * 模拟获取媒体数据。
   *
   * @returns 媒体数据。
   */
  private async createMediaEntity(): Promise<avMusicTemplate.MediaEntity> {
    let mediaEntity: avMusicTemplate.MediaEntity = {
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    };
    return mediaEntity;
  };

  // [StartExclude template_register_listener]
  /**
   * 模拟获取PageMediaEntity。
   *
   * @returns PageMediaEntity实例。
   */
  private async createPageMediaEntity(): Promise<avMusicTemplate.PageMediaEntity> {
    let mediaEntity: avMusicTemplate.MediaEntity = await this.createMediaEntity();
    let pageMediaEntity: avMusicTemplate.PageMediaEntity = {
      errorCode: 0,
      pageIndex: 0,
      pageSize: 1,
      hasMoreData: false,
      totalSize: 1,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      elements: [mediaEntity]
    }
    return pageMediaEntity;
  };

  /**
   * 模拟获取当前单曲。
   *
   * @returns 当前单曲。
   */
  private async createCurrentSingle(): Promise<avMusicTemplate.Single> {
    let playInfo: avMusicTemplate.PlayInfo = {
      playCounts: '100w',
      isSupportNext: true,
      isSupportPrev: false,
      isSupportQuickForward: true,
      isSupportQuickBackward: true,
      quickForwardStep: 10,
      quickBackwardStep: 10,
      isSupportSkipHead: false,
      isSupportSkipTail: true,
      isSupportPlayMode: true,
      isSupportPlayRate: true,
      supportedPlayRate: ['1', '2', '3'],
      currentPlayRate: 'string;',
      isSupportSoundQuality: false,
      isSupportSoundEffect: true,
      totalDuration: 60,
      currentPlayDuration: 10,
      isSupportProgress: false,
    }
    let favoriteData: avMusicTemplate.FavoriteData = {
      isSupportFav: true,
      isFavorite: false,
      favCounts: '1000+'
    }
    let single: avMusicTemplate.Single = {
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: '歌曲标题',
      desc: '歌曲描述',
      imageUrl: '',
      playState: 0,
      isVip: false,
      singer: '',
      tags: [],
      playInfo: playInfo,
      favSubscribeData: favoriteData
    }
    return single;
  };

  /**
   * 模拟操作结果。
   *
   * @returns 操作结果。
   */
  private async createOperResult(): Promise<avMusicTemplate.OperResult> {
    let operResult: avMusicTemplate.OperResult = {
      errorCode: 0,
    }
    return operResult;
  };

  /**
   * 模拟创建二维码信息数组。
   *
   * @returns Promise类型的二维码信息数组。
   */
  private async createQrCodeInfo(): Promise<avMusicTemplate.QrCodeInfo> {
    let qrCodeInfo: avMusicTemplate.QrCodeInfo = {
      id: 'id',
      price: '10',
      titleName: 'title',
      detailName: 'detail',
      tips: 'tip',
      content: 'content',
      validPeriod: 1
    };
    return qrCodeInfo;
  };

  /**
   * 模拟对话框信息。
   *
   * @returns 对话框信息。
   */
  private async createDialogInfo(): Promise<avMusicTemplate.DialogInfo> {
    let qrCodeInfo: avMusicTemplate.QrCodeInfo[] = [{
      id: 'id',
      price: '10',
      titleName: 'title',
      detailName: 'detail',
      tips: 'tip',
      content: 'content',
      validPeriod: 1
    }
    ];
    let dialogInfo: avMusicTemplate.DialogInfo = {
      dialogId: 'dialogId',
      dialogType: avMusicTemplate.DialogType.LOGIN,
      qrCodes: qrCodeInfo
    };
    return dialogInfo;
  };

  /**
   * 模拟查询会员购买信息。
   *
   * @returns Promise类型的购买会员信息数组。
   */
  private async createQueryMemberPurchase(): Promise<avMusicTemplate.MemberPurchaseInfo> {
    let memberPurchaseInfo: avMusicTemplate.MemberPurchaseInfo = {
      id: 'id',
      diagramUrl: 'diagramUrl',
      diagramContent: 'diagramContent',
      memberPurchaseType: avMusicTemplate.MemberPurchaseType.NORMAL
    };
    return memberPurchaseInfo;
  };

  /**
   * 模拟获取自定义内容。
   *
   * @returns 自定义元素。
   */
  private async createCustomContent(): Promise<avMusicTemplate.CustomElement> {
    let mediaEntity: avMusicTemplate.MediaEntity = {
      mediaId: 'mediaId',
      mediaType: avMusicTemplate.EntityType.SINGLE,
      parentId: 'parentId',
      parentMediaType: avMusicTemplate.EntityType.SINGLE,
      title: 'title',
      imageUrl: 'imageUrl',
      playState: avMusicTemplate.PlaybackState.PLAYBACK_STATE_PREPARE
    }
    let compilation: avMusicTemplate.Compilation = {
      errorCode: 0,
      errorMsg: 'success',
      id: 'id',
      title: 'title',
      hasMoreData: false,
      totalSize: 1,
      memberMediaType: avMusicTemplate.EntityType.SINGLE,
      topElements: [mediaEntity]
    };
    let customElement: avMusicTemplate.CustomElement = {
      errorCode: 0,
      customCompilations: [compilation],
    };
    return customElement;
  };

  /**
   * 模拟下载过程。
   *
   * @param mediaEntity 媒体实体。
   */
  private async downloadMediaEntity(mediaEntity: avMusicTemplate.MediaEntity) {
    // 下载完成之后。
    this.setDownloadMediaEntityStatus(mediaEntity);
  };

  /**
   * 模拟设置改变。
   *
   * @returns Promise类型的设置条目。
   */
  private async settingsChange(): Promise<avMusicTemplate.SettingItem> {
    let setting: avMusicTemplate.SettingItem = {
      id: 'id',
      title: 'title',
      desc: 'desc',
      mediaId: 'mediaId',
      settingType: avMusicTemplate.SettingType.SWITCH,
      settingValue: false
    }
    return setting;
  };

  private async handlePromiseArrayReturnFunc<T>(func: () => Promise<T>, errFunc: string): Promise<T[]> {
    try {
      let t: T = await func();
      return [t];
    } catch (e) {
      const msg = `Failed to ${errFunc}. Code: ${e?.code}`;
      console.error(msg);
      throw e instanceof Error ? e : new Error(e?.message ?? msg);
    }
  }

  // [EndExclude template_register_listener]
  private async handlePromiseReturnFunc<T>(func: () => Promise<T>, errFunc: string): Promise<T> {
    try {
      return await func();
    } catch (e) {
      const msg = `Failed to ${errFunc}. Code: ${e?.code}`;
      console.error(msg);
      throw e instanceof Error ? e : new Error(e?.message ?? msg);
    }
  }
  // [EndExclude manager_create_template]
  // [EndExclude set_user_info]
  // [EndExclude unregister_listener]
}
// [End manager_create_template]
// [End template_register_listener]
// [End set_user_info]
// [End unregister_listener]