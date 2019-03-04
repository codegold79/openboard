module Proto.Auth exposing (AddAuthReq, AddVoucherReq, AuthResp, RmvAuthReq, addAuthReqDecoder, addAuthReqEncoder, addVoucherReqDecoder, addVoucherReqEncoder, authRespDecoder, authRespEncoder, rmvAuthReqDecoder, rmvAuthReqEncoder)

-- DO NOT EDIT
-- AUTOGENERATED BY THE ELM PROTOCOL BUFFER COMPILER
-- https://github.com/tiziano88/elm-protobuf
-- source file: proto/auth.proto

import Json.Decode as JD
import Json.Encode as JE
import Protobuf exposing (..)


type alias AuthResp =
    { token : String -- 1
    }


authRespDecoder : JD.Decoder AuthResp
authRespDecoder =
    JD.lazy <|
        \_ ->
            decode AuthResp
                |> required "token" JD.string ""


authRespEncoder : AuthResp -> JE.Value
authRespEncoder v =
    JE.object <|
        List.filterMap identity <|
            [ requiredFieldEncoder "token" JE.string "" v.token
            ]


type alias AddAuthReq =
    { username : String -- 1
    , password : String -- 2
    }


addAuthReqDecoder : JD.Decoder AddAuthReq
addAuthReqDecoder =
    JD.lazy <|
        \_ ->
            decode AddAuthReq
                |> required "username" JD.string ""
                |> required "password" JD.string ""


addAuthReqEncoder : AddAuthReq -> JE.Value
addAuthReqEncoder v =
    JE.object <|
        List.filterMap identity <|
            [ requiredFieldEncoder "username" JE.string "" v.username
            , requiredFieldEncoder "password" JE.string "" v.password
            ]


type alias RmvAuthReq =
    { token : String -- 1
    }


rmvAuthReqDecoder : JD.Decoder RmvAuthReq
rmvAuthReqDecoder =
    JD.lazy <|
        \_ ->
            decode RmvAuthReq
                |> required "token" JD.string ""


rmvAuthReqEncoder : RmvAuthReq -> JE.Value
rmvAuthReqEncoder v =
    JE.object <|
        List.filterMap identity <|
            [ requiredFieldEncoder "token" JE.string "" v.token
            ]


type alias AddVoucherReq =
    { notify : Bool -- 1
    , email : String -- 2
    , password : Bool -- 3
    }


addVoucherReqDecoder : JD.Decoder AddVoucherReq
addVoucherReqDecoder =
    JD.lazy <|
        \_ ->
            decode AddVoucherReq
                |> required "notify" JD.bool False
                |> required "email" JD.string ""
                |> required "password" JD.bool False


addVoucherReqEncoder : AddVoucherReq -> JE.Value
addVoucherReqEncoder v =
    JE.object <|
        List.filterMap identity <|
            [ requiredFieldEncoder "notify" JE.bool False v.notify
            , requiredFieldEncoder "email" JE.string "" v.email
            , requiredFieldEncoder "password" JE.bool False v.password
            ]
