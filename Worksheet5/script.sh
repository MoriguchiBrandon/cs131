#!/bin/bash
IFS=$'\n';
UnitedStates="United States"
Music="Music"
Entertainment="Entertainment"
Gaming="Gaming"
Comedy="Comedy"
for row in $(cat 'Global YouTube Statistics.csv')
do
	IFS="," read rank youtuber subscribers videoViews category title uploads country abbreviation channelType videoViewsRank countryRank channelTypeRank VideoViewsLast30 lowestMonthlyEarnings highestMonthlyEarnings lowestYearlyEarnings highestYearlyEarnings subscriberCountLast30 createdYear createdMonth createdDate grossTertiaryEdEnroll Population unemploymentRate urbanPopulation latitude longitude <<< "$row"

	if [[ "$country" == "$UnitedStates" ]];then
		
		if [[ "$category" == "$Music" || "$category" == "$Entertainment" || "$category" == "$Gaming" || "$category" == "$Comedy" ]];then
			echo "$row" >> ./'United States'/$category.txt
		fi
	fi
done

wc -l 'United States'/Music.txt > ws5.txt
wc -l 'United States'/Entertainment.txt >> ws5.txt
wc -l 'United States'/Gaming.txt >> ws5.txt
wc -l 'United States'/Comedy.txt >> ws5.txt
