#!/usr/bin/bash
GRAFANA_SERVER="http://192.168.2.80:3000"
GRAFANA_TOKEN="glsa_C2caUX6lGBtmiQtP8v3ONX1HIkHeuS3H_b976bd0c"
DASHBOARD_ID="1"
PANEL_ID="77"
TAG="EVENT"
TEXT="Annotation created via API"
CURRENT_TIME="$(date +%s)"
CURRENT_TS="$CURRENT_TIME""000"

AUTH="Authorization: Bearer ""$GRAFANA_TOKEN"
URL="$GRAFANA_SERVER""/api/annotations"

BODY=$(cat <<EOF
{
  "dashboardId": $DASHBOARD_ID,
  "panelId": $PANEL_ID,
  "isRegion": true,
  "tags": ["$TAG"],
  "text": "$TEXT",
  "time": $CURRENT_TS,
  "timeEnd": $CURRENT_TS
}
EOF
)

curl -H "$AUTH" -H "Content-Type: application/json" -XPOST -d "$BODY" "$URL"