# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM node:22-alpine
WORKDIR /app
COPY server.mjs ./
ENV DATA_DIR=/data
VOLUME /data
EXPOSE 8787
USER node
CMD ["node", "server.mjs"]
