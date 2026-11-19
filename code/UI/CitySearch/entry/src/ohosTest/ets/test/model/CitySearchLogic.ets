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

// Search and selection logic of casesfeature/citysearch view/CitySearch.ets, view/SearchView.ets and
// utils/AlphabetListView.ets, evaluated against the real CITY_DATA / HOT_CITY exported by the HAR.

import { AlphabetListItemType, CITY_DATA, CommonConstants, HOT_CITY } from '../../../../main/ets/CitySearchTestBridge';

// Mirrors searchCityList(value) without aliasing CITY_DATA: a letter match returns that letter's list, otherwise
// every city name containing the value is collected.
export function searchCities(value: string): string[] {
  let cityNames: string[] = [];
  CITY_DATA.forEach((item: AlphabetListItemType) => {
    if (item.name.includes(value.toUpperCase())) {
      cityNames = item.dataList.slice();
      return;
    }
    item.dataList.forEach((cityName: string) => {
      if (cityName.includes(value)) {
        cityNames.push(cityName);
      }
    });
  });
  if (value.length !== 0) {
    return cityNames;
  }
  return [];
}

// Mirrors the letter branch of searchCityList(): the index of the last letter group matched by the value.
export function matchedLetterIndexOf(value: string): number {
  let matched: number = -1;
  CITY_DATA.forEach((item: AlphabetListItemType, index: number) => {
    if (item.name.includes(value.toUpperCase())) {
      matched = index;
    }
  });
  return matched;
}

// Mirrors the search result count shown by SearchView.
export function resultCountOf(value: string): number {
  return searchCities(value).length;
}

// Mirrors onSubmit(): an empty value falls back to the placeholder text.
export function submitValueOf(value: string, placeholder: string): string {
  return value.length === 0 ? placeholder : value;
}

// Mirrors onSubmit(): a toast is shown when nothing matched.
export function showsNoResultToast(value: string): boolean {
  return resultCountOf(value) === 0;
}

// Mirrors onChange(): the search list is visible only while the input is not empty.
export function searchStateOf(value: string): boolean {
  return value.length !== 0;
}

// Mirrors the alphabetIndexer built from the AlphabetListItemView names.
export function alphabetIndexer(): string[] {
  return CITY_DATA.map((item: AlphabetListItemType): string => item.name);
}

// Mirrors List.onScrollIndex(firstIndex) -> AlphabetIndexer selected letter.
export function letterAtIndex(index: number): string {
  const letters: string[] = alphabetIndexer();
  if (!Number.isInteger(index) || index < 0 || index >= letters.length) {
    return '';
  }
  return letters[index];
}

// Mirrors AlphabetIndexer.onSelect(tabIndex): the list group scrolled to for a letter.
export function groupIndexOfLetter(letter: string): number {
  return alphabetIndexer().indexOf(letter);
}

// Mirrors the number of cities listed under a letter.
export function groupSizeOf(letter: string): number {
  const index: number = groupIndexOfLetter(letter);
  return index < 0 ? 0 : CITY_DATA[index].dataList.length;
}

// Mirrors the hot city grid.
export function hotCityAt(index: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= HOT_CITY.length) {
    return '';
  }
  return HOT_CITY[index];
}

// Mirrors whether a name is offered as a hot city.
export function isHotCity(name: string): boolean {
  return HOT_CITY.indexOf(name) >= 0;
}

// Mirrors the letter group a city name belongs to ('' when it is not listed).
export function letterOfCity(cityName: string): string {
  for (const item of CITY_DATA) {
    if (item.dataList.indexOf(cityName) >= 0) {
      return item.name;
    }
  }
  return '';
}

// Mirrors the placeholder and initial value constants.
export function defaultTexts(): string[] {
  return [CommonConstants.PLACE_HOLDER_TEXT, CommonConstants.INIT_VALUE];
}

// Mirrors the CitySearch component state driven by the search input and the list handlers.
export class CitySearchState {
  changeValue: string = '';
  isSearchState: boolean = false;
  searchList: string[] = [];
  toasts: number = 0;

  // Mirrors TextInput.onSubmit().
  submit(value: string): number {
    const input: string = submitValueOf(value, CommonConstants.PLACE_HOLDER_TEXT);
    this.changeValue = input;
    this.isSearchState = true;
    this.searchList = searchCities(input);
    if (this.searchList.length === 0) {
      this.toasts++;
    }
    return this.searchList.length;
  }

  // Mirrors TextInput.onChange().
  change(value: string): number {
    this.changeValue = value;
    if (value.length === 0) {
      this.isSearchState = false;
      this.searchList = [];
      return 0;
    }
    this.isSearchState = true;
    this.searchList = searchCities(value);
    return this.searchList.length;
  }

  // Mirrors hotCityHandle() / alphabetSelectHandle(): the picked name fills the input.
  pick(name: string): string {
    this.changeValue = name;
    return this.changeValue;
  }

  // Mirrors SearchView item onClick(): the tapped result becomes the input value.
  pickResult(index: number): string {
    if (index >= 0 && index < this.searchList.length && Number.isInteger(index)) {
      this.changeValue = this.searchList[index];
    }
    return this.changeValue;
  }
}
