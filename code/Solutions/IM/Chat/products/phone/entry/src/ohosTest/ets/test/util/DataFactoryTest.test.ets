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
import hilog from '@ohos.hilog';
import { getChatModelObjFromJSON, getFriendMomentObjFromJSON, getMessageListFromJSON, makeDataLocal, makeDataList } from '@ohos/chatlist/src/main/ets/utils/DataFactory';
import Constants from '@ohos/chatlist/src/main/ets/utils/Constants';
import PageConstants from '@ohos/chatlist/src/main/ets/utils/PageConstants';
import ChatListJsonData from '@ohos/chatlist/src/main/ets/utils/ChatListJsonData';
import { ChatListData } from '@ohos/chatlist/src/main/ets/viewmodel/ChatListDataSource';
import { ChatModel } from '@ohos/chatlist/src/main/ets/viewmodel/MsgBase';

const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Chat_';
const TAG: string = 'DataFactoryTest';
const MOCK_CHAT_ONE: string = 'mockChatOneModelData.json';
const MOCK_CHAT_TWO: string = 'mockChatTwoModelData.json';

/**
 * 数据工厂与常量矩阵：mock 解析、数据装配、缓存与路由常量。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function dataFactoryTest(): void {
  describe('DataFactoryTest', (): void => {
    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0100
     * @tc.name      chat_model_json_should_be_parsed_001
     * @tc.desc      Verify the first mock file yields a non-empty conversation list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_model_json_should_be_parsed_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_json_should_be_parsed_001, begin');
      await yieldThread();
      // 让出一次主线程，避免连续解析占用过长
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 10);
      });
      const models = await getChatModelObjFromJSON(MOCK_CHAT_ONE);
      const check1 = models.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_json_should_be_parsed_001, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `mock one size=${models.length}`);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_model_json_should_be_parsed_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0200
     * @tc.name      first_chat_model_should_keep_user_id_002
     * @tc.desc      Verify the first parsed conversation keeps userId from the json file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'first_chat_model_should_keep_user_id_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_model_should_keep_user_id_002, begin');
      await yieldThread();
      const models = await getChatModelObjFromJSON(MOCK_CHAT_ONE);
      const check1 = models.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_model_should_keep_user_id_002, value:' + check1);
      expect(check1).assertTrue();
      const check2 = models[0].user.userId;
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_model_should_keep_user_id_002, value:' + check2);
      expect(check2).assertEqual('0');
      const check3 = models[0].user.userName;
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_model_should_keep_user_id_002, value:' + check3);
      expect(check3).assertEqual('一日就旧');
      hilog.info(DOMAIN, TAG, BUNDLE + 'first_chat_model_should_keep_user_id_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0300
     * @tc.name      second_mock_file_should_also_be_parsed_003
     * @tc.desc      Verify the second mock file is parsed independently and is not empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'second_mock_file_should_also_be_parsed_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_mock_file_should_also_be_parsed_003, begin');
      await yieldThread();
      const models = await getChatModelObjFromJSON(MOCK_CHAT_TWO);
      const check1 = models.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_mock_file_should_also_be_parsed_003, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'second_mock_file_should_also_be_parsed_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0400
     * @tc.name      moment_json_should_return_array_004
     * @tc.desc      Verify the moment loader returns an array without throwing when the underlying mock file has no FriendMoment section.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'moment_json_should_return_array_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_json_should_return_array_004, begin');
      await yieldThread();
      const moments = await getFriendMomentObjFromJSON();
      const check1 = Array.isArray(moments);
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_json_should_return_array_004, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `moment size=${moments.length}`);
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'moment_json_should_return_array_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0500
     * @tc.name      message_json_should_be_parsed_005
     * @tc.desc      Verify the message list mock file yields a non-empty string list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_json_should_be_parsed_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_json_should_be_parsed_005, begin');
      await yieldThread();
      const messages: string[] = await getMessageListFromJSON();
      const check1 = messages.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_json_should_be_parsed_005, value:' + check1);
      expect(check1).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_json_should_be_parsed_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0600
     * @tc.name      message_list_should_contain_non_empty_texts_006
     * @tc.desc      Verify every parsed message entry is a non-empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'message_list_should_contain_non_empty_texts_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_list_should_contain_non_empty_texts_006, begin');
      await yieldThread();
      const messages: string[] = await getMessageListFromJSON();
      const check1 = messages.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_list_should_contain_non_empty_texts_006, value:' + check1);
      expect(check1).assertTrue();
      for (let index: number = 0; index < messages.length; index++) {
        const check2 = messages[index].length > 0;
        hilog.info(DOMAIN, TAG, BUNDLE + 'message_list_should_contain_non_empty_texts_006, value:' + check2);
        expect(check2).assertTrue();
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'message_list_should_contain_non_empty_texts_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0700
     * @tc.name      chat_models_should_have_last_message_007
     * @tc.desc      Verify every parsed conversation carries a non-empty last message preview.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_models_should_have_last_message_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_models_should_have_last_message_007, begin');
      await yieldThread();
      const models = await getChatModelObjFromJSON(MOCK_CHAT_ONE);
      const check1 = models.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_models_should_have_last_message_007, value:' + check1);
      expect(check1).assertTrue();
      for (let index: number = 0; index < models.length; index++) {
        const check2 = String(models[index].lastMsg).length > 0;
        hilog.info(DOMAIN, TAG, BUNDLE + 'chat_models_should_have_last_message_007, value:' + check2);
        expect(check2).assertTrue();
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_models_should_have_last_message_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0800
     * @tc.name      parsed_models_should_have_non_empty_names_008
     * @tc.desc      Verify every parsed conversation carries a non-empty user name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'parsed_models_should_have_non_empty_names_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'parsed_models_should_have_non_empty_names_008, begin');
      await yieldThread();
      const models = await getChatModelObjFromJSON(MOCK_CHAT_ONE);
      const check1 = models.length > 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'parsed_models_should_have_non_empty_names_008, value:' + check1);
      expect(check1).assertTrue();
      for (let index: number = 0; index < models.length; index++) {
        const check2 = String(models[index].user.userName).length > 0;
        hilog.info(DOMAIN, TAG, BUNDLE + 'parsed_models_should_have_non_empty_names_008, value:' + check2);
        expect(check2).assertTrue();
      }
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'parsed_models_should_have_non_empty_names_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_0900
     * @tc.name      cached_count_zero_should_be_zero_009
     * @tc.desc      Verify the no-cache constant is zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'cached_count_zero_should_be_zero_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_zero_should_be_zero_009, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'constant check start');
      const check1 = Constants.CACHED_COUNT_0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_zero_should_be_zero_009, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_zero_should_be_zero_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1000
     * @tc.name      cached_count_should_be_ten_010
     * @tc.desc      Verify the lazy-load cache window is ten items.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'cached_count_should_be_ten_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_should_be_ten_010, begin');
      await yieldThread();
      const check1 = Constants.CACHED_COUNT;

      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_should_be_ten_010, value:' + check1);

      expect(check1).assertEqual(10);
      hilog.info(DOMAIN, TAG, BUNDLE + 'cached_count_should_be_ten_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1100
     * @tc.name      data_mock_count_should_be_5000_011
     * @tc.desc      Verify the mock data fill count is five thousand.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'data_mock_count_should_be_5000_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'data_mock_count_should_be_5000_011, begin');
      await yieldThread();
      const check1 = Constants.DATA_MOCK_COUNT;

      hilog.info(DOMAIN, TAG, BUNDLE + 'data_mock_count_should_be_5000_011, value:' + check1);

      expect(check1).assertEqual(5000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'data_mock_count_should_be_5000_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1200
     * @tc.name      mock_element_count_should_be_120_012
     * @tc.desc      Verify the chat detail message cap is one hundred twenty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'mock_element_count_should_be_120_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'mock_element_count_should_be_120_012, begin');
      await yieldThread();
      const check1 = Constants.MOCK_ELEMENT_COUNT;

      hilog.info(DOMAIN, TAG, BUNDLE + 'mock_element_count_should_be_120_012, value:' + check1);

      expect(check1).assertEqual(120);
      hilog.info(DOMAIN, TAG, BUNDLE + 'mock_element_count_should_be_120_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1300
     * @tc.name      friend_moment_count_should_be_100_013
     * @tc.desc      Verify the friend moment mock size is one hundred.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'friend_moment_count_should_be_100_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_count_should_be_100_013, begin');
      await yieldThread();
      const check1 = Constants.FRIEND_MOMENT_MOCK_DATA_COUNT;

      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_count_should_be_100_013, value:' + check1);

      expect(check1).assertEqual(100);
      hilog.info(DOMAIN, TAG, BUNDLE + 'friend_moment_count_should_be_100_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1400
     * @tc.name      chat_detail_route_should_be_registered_014
     * @tc.desc      Verify the chat detail route path used by the sample.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_detail_route_should_be_registered_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_detail_route_should_be_registered_014, begin');
      await yieldThread();
      const check1 = PageConstants.CHAT_DETAIL_PAGE;

      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_detail_route_should_be_registered_014, value:' + check1);

      expect(check1).assertEqual('pages/ChatDetailPage');
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_detail_route_should_be_registered_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1500
     * @tc.name      detail_route_should_be_registered_015
     * @tc.desc      Verify the detail container route path used by the chat list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'detail_route_should_be_registered_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_route_should_be_registered_015, begin');
      await yieldThread();
      const check1 = PageConstants.DETAIL_PAGE;

      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_route_should_be_registered_015, value:' + check1);

      expect(check1).assertEqual('pages/Detail');
      hilog.info(DOMAIN, TAG, BUNDLE + 'detail_route_should_be_registered_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1600
     * @tc.name      search_route_should_be_registered_016
     * @tc.desc      Verify the search route path constant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'search_route_should_be_registered_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_route_should_be_registered_016, begin');
      await yieldThread();
      const check1 = PageConstants.SEARCH_PAGE;

      hilog.info(DOMAIN, TAG, BUNDLE + 'search_route_should_be_registered_016, value:' + check1);

      expect(check1).assertEqual('pages/SearchPage');
      hilog.info(DOMAIN, TAG, BUNDLE + 'search_route_should_be_registered_016, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1700
     * @tc.name      chat_list_should_have_two_mock_files_017
     * @tc.desc      Verify the chat list mock file list contains exactly two files.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_list_should_have_two_mock_files_017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_should_have_two_mock_files_017, begin');
      await yieldThread();
      const check1: number = ChatListJsonData.CHAT_LIST_JSON_DATA.length;

      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_should_have_two_mock_files_017, value:' + check1);

      expect(check1).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_should_have_two_mock_files_017, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1800
     * @tc.name      chat_list_mock_files_should_be_named_018
     * @tc.desc      Verify the two mock file names match the packaged resources.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'chat_list_mock_files_should_be_named_018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_mock_files_should_be_named_018, begin');
      await yieldThread();
      const check1 = ChatListJsonData.CHAT_LIST_JSON_DATA[0];

      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_mock_files_should_be_named_018, value:' + check1);

      expect(check1).assertEqual('mockChatOneModelData.json');
      const check2 = ChatListJsonData.CHAT_LIST_JSON_DATA[1];
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_mock_files_should_be_named_018, value:' + check2);
      expect(check2).assertEqual('mockChatTwoModelData.json');
      hilog.info(DOMAIN, TAG, BUNDLE + 'chat_list_mock_files_should_be_named_018, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_1900
     * @tc.name      make_data_local_should_fill_data_source_019
     * @tc.desc      Verify makeDataLocal fills the lazy data source up to the mock count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'make_data_local_should_fill_data_source_019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_local_should_fill_data_source_019, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'make data local start');
      const data: ChatListData = new ChatListData();
      await makeDataLocal(data, MOCK_CHAT_ONE);
      const check1 = data.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_local_should_fill_data_source_019, value:' + check1);
      expect(check1).assertEqual(Constants.DATA_MOCK_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'make data local end');
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_local_should_fill_data_source_019, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATAFACTORY_2000
     * @tc.name      make_data_list_should_fill_array_020
     * @tc.desc      Verify makeDataList fills a plain array up to the mock count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'make_data_list_should_fill_array_020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_list_should_fill_array_020, begin');
      await yieldThread();
      const list: ChatModel[] = [];
      await makeDataList(list, MOCK_CHAT_ONE);
      const check1: number = list.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_list_should_fill_array_020, value:' + check1);
      expect(check1).assertEqual(Constants.DATA_MOCK_COUNT);
      hilog.info(DOMAIN, TAG, BUNDLE + 'make_data_list_should_fill_array_020, end');
    });  });
}
