/*
 * (C) Copyright 2015 Kurento (http://kurento.org/)
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 */

#ifndef __KMS_I_SDP_SESSION_EXTENSION_H__
#define __KMS_I_SDP_SESSION_EXTENSION_H__

#include <gst/gst.h>
#include <gst/sdp/gstsdpmessage.h>

#include "kmssdpcontext.h"

G_BEGIN_DECLS

#define KMS_TYPE_I_SDP_SESSION_EXTENSION    \
  (kms_i_sdp_session_extension_get_type())

#define KMS_I_SDP_SESSION_EXTENSION(obj) (  \
  G_TYPE_CHECK_INSTANCE_CAST (              \
    (obj),                                  \
    KMS_TYPE_I_SDP_SESSION_EXTENSION,       \
    KmsISdpSessionExtension                 \
  )                                         \
)
#define KMS_IS_I_SDP_SESSION_EXTENSION(obj) (  \
  G_TYPE_CHECK_INSTANCE_TYPE (                 \
    (obj),                                     \
    KMS_TYPE_I_SDP_SESSION_EXTENSION           \
  )                                            \
)
#define KMS_I_SDP_SESSION_EXTENSION_CAST(obj) ((KmsISdpSessionExtension*)(obj))
#define KMS_I_SDP_SESSION_EXTENSION_GET_INTERFACE(obj)  \
  (G_TYPE_INSTANCE_GET_INTERFACE(                       \
    (obj),                                              \
    KMS_TYPE_I_SDP_SESSION_EXTENSION,                   \
    KmsISdpSessionExtensionInterface                    \
  )                                                     \
)

typedef struct _KmsISdpSessionExtension KmsISdpSessionExtension;
typedef struct _KmsISdpSessionExtensionInterface KmsISdpSessionExtensionInterface;

struct _KmsISdpSessionExtensionInterface
{
  GTypeInterface parent_iface;

  gboolean (*add_offer_attributes) (KmsISdpSessionExtension *ext, GstSDPMessage * offer, GError **error);
  gboolean (*add_answer_attributes) (KmsISdpSessionExtension *ext, const GstSDPMessage * offer, GstSDPMessage * answer, GError **error);
  gboolean (*can_insert_attribute) (KmsISdpSessionExtension *ext, const GstSDPMessage * offer, const GstSDPAttribute * attr, GstSDPMessage * answer);
};

GType kms_i_sdp_session_extension_get_type (void);

gboolean kms_i_sdp_session_extension_add_offer_attributes (KmsISdpSessionExtension *ext, GstSDPMessage * offer, GError **error);
gboolean kms_i_sdp_session_extension_add_answer_attributes (KmsISdpSessionExtension *ext, const GstSDPMessage * offer, GstSDPMessage * answer, GError **error);
gboolean kms_i_sdp_session_extension_can_insert_attribute (KmsISdpSessionExtension *ext, const GstSDPMessage * offer, const GstSDPAttribute * attr, GstSDPMessage * answer);

G_END_DECLS

#endif /* __KMS_I_SDP_SESSION_EXTENSION_H__ */
