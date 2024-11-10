# API KLinik Documentation

API ini menyediakan informasi tentang tempat-tempat KLinik Kesehatan Mental di lokasi yang ditentukan serta detail informasi untuk tempat tertentu.

## Base URL
```
http://localhost:3000
```

## Endpoints

### 1. Search Places
Mencari tempat-tempat di sekitar lokasi yang ditentukan.

```
GET /api/places/search
```

#### Parameters
| Parameter | Type   | Required | Description                     |
|-----------|--------|----------|---------------------------------|
| lat       | number | Yes      | Latitude lokasi (contoh: -6.2088) |
| lng       | number | Yes      | Longitude lokasi (contoh: 106.8456) |
| radius    | number | Optional | Radius lokasi (contoh: 1000 == 1km) |

#### Response Success

```json
{
    "status": "success",
    "data": [
        {
            "business_status": "OPERATIONAL",
            "geometry": {
                "location": {
                    "lat": number,
                    "lng": number
                },
                "viewport": {
                    "northeast": {
                        "lat": number,
                        "lng": number
                    },
                    "southwest": {
                        "lat": number,
                        "lng": number
                    }
                }
            },
            "icon": string,
            "icon_background_color": string,
            "icon_mask_base_uri": string,
            "name": string,
            "opening_hours": {
                "open_now": boolean
            },
            "photos": [
                {
                    "height": number,
                    "html_attributions": array,
                    "photo_reference": string,
                    "width": number
                }
            ],
            "place_id": string,
            "plus_code": {
                "compound_code": string,
                "global_code": string
            },
            "rating": number,
            "reference": string,
            "scope": string,
            "types": array,
            "user_ratings_total": number,
            "vicinity": string,
            "photoUrl": string
        }
    ]
}
```

### 2. Get Place Details
Mendapatkan informasi detail tentang tempat tertentu.

```
GET /api/details/:reference
```

#### Parameters
| Parameter | Type   | Required | Description                |
|-----------|--------|----------|----------------------------|
| reference | string | Yes      | Reference ID dari tempat   |

#### Response Success

```json
{
    "status": "success",
    "data": {
        "formatted_address": string,
        "formatted_phone_number": string,
        "geometry": {
            "location": {
                "lat": number,
                "lng": number
            },
            "viewport": {
                "northeast": {
                    "lat": number,
                    "lng": number
                },
                "southwest": {
                    "lat": number,
                    "lng": number
                }
            }
        },
        "name": string,
        "photos": [
            {
                "height": number,
                "html_attributions": array,
                "photo_reference": string,
                "width": number
            }
        ],
        "rating": number,
        "reviews": [
            {
                "author_name": string,
                "author_url": string,
                "language": string,
                "original_language": string,
                "profile_photo_url": string,
                "rating": number,
                "relative_time_description": string,
                "text": string,
                "time": number,
                "translated": boolean
            }
        ],
        "user_ratings_total": number,
        "website": string,
        "photoUrl": string
    }
}
```

## Contoh Penggunaan

### Search Places
```bash
curl "http://localhost:3000/api/places/search?lat=-6.2088&lng=106.8456"
```

### Get Place Details
```bash
curl "http://localhost:3000/api/details/ChIJXSPVCc4e4iMR7VLDnvu5U1M"
```

## Catatan
- Semua response akan memiliki format JSON
- Status code 200 akan dikembalikan untuk response sukses
- Pastikan untuk menyertakan parameter yang diperlukan untuk setiap endpoint
- Photo URL yang dikembalikan sudah termasuk API key yang diperlukan